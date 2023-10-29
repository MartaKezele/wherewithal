import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../app_models/action_result.dart';
import '../../app_models/product_item_data.dart';
import '../../change_notifiers/auth.dart';
import '../../change_notifiers/currency.dart';
import '../../components/bottom_sheets/camera_gallery_bottom_sheet.dart';
import '../../components/dialogs/confirm_dialog.dart';
import '../../components/form/custom_form.dart';
import '../../components/form/form_fields/date_form_field.dart';
import '../../components/image_preview.dart';
import '../../components/product_item_card.dart';
import '../../components/wrappers/loading_overlay_wrapper.dart';
import '../../components/wrappers/screen.dart';
import '../../constants/padding_size.dart';
import '../../constants/spacers.dart';
import '../../constants/styles/filled_button.dart';
import '../../constants/styles/outlined_button.dart';
import '../../l10n/app_localizations.dart';
import '../../models/receipt_data.dart';
import '../../models/receipt_product.dart';
import '../../utils/form.dart';
import '../../utils/overlay_banner.dart';
import '../../utils/receipt_recognition_api.dart';
import '../../models/models.dart' as models;
import '../../extensions/button/filled_button.dart';
import '../../extensions/button/outlined_button.dart';
import '../../extensions/button/button_style_button.dart';

const _totalPriceFranctionDigits = 2;

class CreateReceipt extends StatefulWidget with GetItStatefulWidgetMixin {
  CreateReceipt({
    super.key,
  });

  @override
  State<CreateReceipt> createState() => _CreateReceiptState();
}

class _CreateReceiptState extends State<CreateReceipt> with GetItStateMixin {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _imagePicker = ImagePicker();

  final List<ActionResult<ReceiptData?>> _receiptResults = [];
  OverlayEntry? _resultBanner;
  bool _loading = false;
  String? _loadingMessage;
  final List<ProductItemData> _productItems = [];
  DateTime? _dateTime;
  bool _saving = false;

  void _setReceiptDate(ReceiptData receiptData) {
    final receiptDateTime = receiptData.receiptResponse?.dateTime;
    if (receiptDateTime != null) {
      setState(() {
        _dateTime = receiptDateTime;
      });
    }
  }

  void _addProductItemsFromReceipt(
    XFile? imageFile,
    List<ReceiptProduct>? productItems,
  ) {
    if (productItems != null) {
      final items = productItems.map((receiptProduct) {
        String productTitle;
        if (receiptProduct.quantity != null && receiptProduct.quantity != 1) {
          productTitle =
              '${receiptProduct.quantity}x ${receiptProduct.productName}';
        } else {
          productTitle = receiptProduct.productName;
        }

        return ProductItemData(
          imagefile: imageFile,
          titleController: TextEditingController(text: productTitle),
          priceController: TextEditingController(
            text: receiptProduct.productPrice != null
                ? '${receiptProduct.productPrice}'
                : '',
          ),
          // TODO determine category using AI
          category: null,
        );
      });
      setState(() {
        _productItems.addAll(items);
      });
    }
  }

  Future<void> _pickAndHandleGalleryImages(
    AppLocalizations localizations,
  ) async {
    try {
      await _imagePicker.pickMultiImage().then((imageFiles) async {
        if (imageFiles.isNotEmpty) {
          setState(() {
            _loading = true;
            _loadingMessage = localizations.processingReceipts;
          });
          await processReceipts(
            imageFiles: imageFiles,
            localizations: localizations,
          ).then((results) async {
            if (results.any((actionResult) => actionResult.success)) {
              for (final result in results) {
                _receiptResults.add(result);
                if (result.success && result.data != null) {
                  _setReceiptDate(result.data!);
                  _addProductItemsFromReceipt(
                    result.data!.imageFile,
                    result.data!.receiptResponse?.productItems,
                  );
                }
              }
            } else {
              _resultBanner = showActionResultOverlayBanner(
                context,
                results.first,
              );
            }
            setState(() {
              _loading = false;
              _loadingMessage = null;
            });
          });
        }
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _loadingMessage = null;
      });

      // ignore: use_build_context_synchronously
      _resultBanner = showActionResultOverlayBanner(
        context,
        ActionResult(
          success: false,
          messageTitle: localizations.failurePickingImages,
        ),
      );
    }
  }

  Future<void> _takeAndHandleCameraImage(
    AppLocalizations localizations,
  ) async {
    try {
      final XFile? pickedFile = await _imagePicker.pickImage(
        source: ImageSource.camera,
      );
      if (pickedFile != null) {
        setState(() {
          _loading = true;
          _loadingMessage = localizations.processingReceipts;
        });
        await processReceipt(
          imageFile: pickedFile,
          localizations: localizations,
        ).then((result) {
          if (result.success && result.data != null) {
            _receiptResults.add(result);
            _setReceiptDate(result.data!);
            _addProductItemsFromReceipt(
              result.data!.imageFile,
              result.data!.receiptResponse?.productItems,
            );
          } else {
            _resultBanner = showActionResultOverlayBanner(
              context,
              result,
            );
          }
          setState(() {
            _loading = false;
            _loadingMessage = null;
          });
        });
      }
    } catch (e) {
      setState(() {
        _loading = false;
        _loadingMessage = null;
      });
      // ignore: use_build_context_synchronously
      _resultBanner = showActionResultOverlayBanner(
        context,
        ActionResult(
          success: false,
          messageTitle: localizations.failureCapturingImage,
        ),
      );
    }
  }

  double _calculateTotalPrice() {
    final prices = _productItems.map((productItemData) {
      return double.tryParse(productItemData.priceController.text);
    }).map((price) => price ?? 0);

    double totalPrice = 0;
    if (prices.isNotEmpty) {
      totalPrice = prices.reduce((price1, price2) => price1 + price2);
    }

    return totalPrice;
  }

  models.ValueTransaction _itemToValueTransactionInfo(
    ProductItemData productItem,
  ) {
    assert(productItem.category != null);
    assert(_dateTime != null);

    final category = productItem.category!;
    final title = productItem.titleController.text.trim();

    return models.ValueTransaction(
      id: '',
      title: title.isNotEmpty ? title : null,
      value: double.parse(productItem.priceController.text.trim()),
      dateTime: _dateTime!,
      categoryId: category.id,
      categoryTitle: category.title,
      categoryTransactionType: category.transactionType,
      categoryReason: category.categoryReason,
    );
  }

  Future<int> _createValueTransactions() async {
    int numberOfCreatedTransactions = 0;

    for (final productItem in _productItems) {
      try {
        await models.usersRef
            .doc(GetIt.I<AuthChangeNotifier>().id)
            .valueTransactions
            .add(_itemToValueTransactionInfo(productItem));
        numberOfCreatedTransactions++;
      } catch (_) {
        debugPrint('Value transaction not created.');
      }
    }

    return numberOfCreatedTransactions;
  }

  Future<void> _save() async {
    setState(() {
      _saving = true;
    });

    final localizations = AppLocalizations.of(context);

    await _createValueTransactions().then((numberOfCreatedTransactions) {
      if (numberOfCreatedTransactions == 0) {
        _resultBanner = showActionResultOverlayBanner(
          context,
          ActionResult(
            success: false,
            messageTitle: localizations.couldNotCreateTransactions,
          ),
        );
      } else if (numberOfCreatedTransactions < _productItems.length) {
        _resultBanner = showActionResultOverlayBanner(
          context,
          ActionResult(
            success: false,
            messageTitle: localizations.createdXOutOfYTransactions(
              numberOfCreatedTransactions,
              _productItems.length,
            ),
          ),
        );
      } else {
        showActionResultOverlayBanner(
          context,
          ActionResult(
            success: true,
            messageTitle: localizations.createdTransactions,
          ),
        );
        context.pop();
      }

      setState(() {
        _saving = false;
      });
    });
  }

  @override
  void initState() {
    _dateTime = DateTime.now();
    super.initState();
  }

  @override
  void dispose() {
    hideOverlayBanner(_resultBanner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final String? currency = watchOnly(
      (CurrencyChangeNotifier changeNotifier) =>
          changeNotifier.currency?.symbol,
    );

    return LoadingOverlayWrapper(
      loading: _loading,
      loadingMessage: _loadingMessage,
      child: Screen(
        appBar: AppBar(
          title: Text(localizations.newReceipt),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          useSafeArea: true,
                          builder: (BuildContext context) =>
                              CameraGalleryBottomSheet(
                            pickAndHandleGalleryImages:
                                _pickAndHandleGalleryImages,
                            takeAndHandleCameraImage: _takeAndHandleCameraImage,
                          ),
                        );
                      },
                      icon: const Icon(Icons.add_a_photo_rounded),
                      label: Text(localizations.scanReceipt),
                    ).colorStyle(OutlinedButtonStyles.primary),
                    HeightSpacer.xxs,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        children: _receiptResults.reversed.map(
                          (result) {
                            return ImagePreview(
                              onRemovePressed: () {
                                setState(() {
                                  _receiptResults.remove(result);
                                  if (result.data?.imageFile != null) {
                                    _productItems.removeWhere((product) =>
                                        product.imagefile ==
                                        result.data?.imageFile);
                                  }
                                });
                              },
                              imageFile: result.data!.imageFile,
                              errorMessage:
                                  result.success ? null : result.messageTitle,
                            );
                          },
                        ).toList(),
                      ),
                    ),
                    CustomForm(
                      spacing: PaddingSize.sm,
                      formKey: _formKey,
                      contents: [
                        DateFormField(
                          required: true,
                          setDateTime: (dateTime) {
                            setState(() {
                              _dateTime = dateTime;
                            });
                          },
                          dateTime: _dateTime,
                        ),
                        FilledButton.icon(
                          onPressed: () {
                            setState(() {
                              _productItems.add(
                                ProductItemData(
                                  titleController: TextEditingController(),
                                  priceController: TextEditingController(),
                                  category: null,
                                ),
                              );
                            });
                          },
                          icon: const Icon(Icons.add_rounded),
                          label: Text(localizations.addItem),
                        ).colorStyle(FilledButtonStyles.primaryContainer),
                        Wrap(
                          children: _productItems.reversed.map((productItem) {
                            return ProductItemCard(
                              titleController: productItem.titleController,
                              priceValueController: productItem.priceController,
                              category: productItem.category,
                              onCategorySelectionChanged: (selection) {
                                if (selection.isNotEmpty) {
                                  setState(() {
                                    productItem.category =
                                        selection.first.value;
                                  });
                                }
                              },
                              onRemove: () {
                                setState(() {
                                  _productItems.remove(productItem);
                                });
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            HeightSpacer.sm,
            FilledButton(
              onPressed: _productItems.isEmpty
                  ? null
                  : () => executeFnIfFormValid(
                        formKey: _formKey,
                        fn: () async {
                          showConfirmDialog(
                            context: context,
                            title: localizations.addReceiptTransactions,
                            description: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  localizations.totalPrice,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                                Text(
                                  '${_calculateTotalPrice().toStringAsFixed(_totalPriceFranctionDigits)} $currency',
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ],
                            ),
                            onOkPressed: () {
                              context.pop();
                              _save();
                            },
                          );
                        },
                      ),
              child: Text(MaterialLocalizations.of(context).saveButtonLabel),
            )
                .colorStyle(
                  FilledButtonStyles.enterAppPrimary,
                )
                .loadingBtn(
                  constructor: FilledButton.new,
                  isLoading: _saving,
                  colorStyle: FilledButtonStyles.enterAppPrimary,
                ),
          ],
        ),
      ),
    );
  }
}
