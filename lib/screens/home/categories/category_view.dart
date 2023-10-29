import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:go_router/go_router.dart';

import '../../../app_models/action_result.dart';
import '../../../change_notifiers/auth.dart';
import '../../../components/categories_list_view.dart';
import '../../../components/dialogs/confirm_dialog.dart';
import '../../../components/dialogs/scrollable_form_dialog.dart';
import '../../../components/error_content.dart';
import '../../../components/form/category_form.dart';
import '../../../components/loading_content.dart';
import '../../../components/no_data_content.dart';
import '../../../constants/icon_size.dart';
import '../../../constants/padding_size.dart';
import '../../../constants/spacers.dart';
import '../../../constants/styles/filled_button.dart';
import '../../../constants/themes/floating_action_button.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/models.dart' as models;
import '../../../utils/form.dart';
import '../../../utils/overlay_banner.dart';
import '../../../extensions/button/filled_button.dart';
import '../../../extensions/button/button_style_button.dart';

class CategoryView extends StatefulWidget with GetItStatefulWidgetMixin {
  CategoryView({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> with GetItStateMixin {
  final _updateCategoryFormKey = GlobalKey<CategoryFormState>();
  final _updateCategoryFormStateKey = GlobalKey<FormState>();
  final _addSubcategoryFormKey = GlobalKey<CategoryFormState>();
  final _addSubcategoryFormStateKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();

  bool _deleting = false;
  bool _updating = false;
  OverlayEntry? _resultBanner;

  Future<void> _delete(String categoryTitle) async {
    setState(() {
      _deleting = true;
    });

    try {
      models.usersRef
          .doc(GetIt.I<AuthChangeNotifier>().id)
          .categories
          .doc(widget.id)
          .delete()
          .then((_) {
        setState(() {
          _deleting = false;
        });
        showActionResultOverlayBanner(
          context,
          ActionResult(
            success: true,
            messageTitle:
                AppLocalizations.of(context).deletedCategory(categoryTitle),
          ),
        );
        context.pop();
      });
    } catch (_) {
      setState(() {
        _deleting = false;
      });
      _resultBanner = showActionResultOverlayBanner(
        context,
        ActionResult(
          success: false,
          messageTitle: AppLocalizations.of(context)
              .couldNotDeleteCategory(categoryTitle),
        ),
      );
    }
  }

  Future<void> _update() async {
    setState(() {
      _updating = true;
    });
    await _updateCategoryFormKey.currentState?.updateCategory().then((result) {
      setState(() {
        _updating = false;
      });
      _resultBanner = showActionResultOverlayBanner(context, result);
    });
  }

  Future<ActionResult> _createSubcategory() async {
    assert(_addSubcategoryFormKey.currentState != null);
    return _addSubcategoryFormKey.currentState!.addCategory();
  }

  void _showCreateSubcategoryDialog(models.Category parentCategory) async {
    await showScrollableFormDialog<ActionResult>(
      context: context,
      title: AppLocalizations.of(context).addSubcategory,
      form: CategoryForm(
        key: _addSubcategoryFormKey,
        formKey: _addSubcategoryFormStateKey,
        category: models.Category(
          id: '',
          title: '',
          transactionType: parentCategory.transactionType,
          parentCategoryId: parentCategory.id,
        ),
        disableTransactionTypeField: true,
      ),
      formKey: _addSubcategoryFormStateKey,
      onSubmit: _createSubcategory,
      submitBtnText: MaterialLocalizations.of(context).saveButtonLabel,
    ).then((result) {
      if (result != null) {
        _resultBanner = showActionResultOverlayBanner(
          context,
          result,
        );
      }
    });
  }

  @override
  void dispose() {
    hideOverlayBanner(_resultBanner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final deleteColor = Theme.of(context).colorScheme.error;
    final bgColor = Theme.of(context).colorScheme.surfaceVariant;
    final fgColor = Theme.of(context).colorScheme.onSurfaceVariant;

    return FirestoreBuilder<models.CategoryDocumentSnapshot>(
      ref: models.usersRef
          .doc(GetIt.I<AuthChangeNotifier>().id)
          .categories
          .doc(widget.id),
      builder: (
        context,
        AsyncSnapshot<models.CategoryDocumentSnapshot> snapshot,
        Widget? child,
      ) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text(localizations.error),
            ),
            body: const ErrorContent(),
          );
        }

        if (!snapshot.hasData) {
          return LoadingContent(color: fgColor);
        }

        final category = snapshot.requireData.data;

        if (category == null) {
          return Scaffold(
            appBar: AppBar(
              title: Text(localizations.noData),
            ),
            body: const NoDataContent(),
          );
        }

        final subcategoriesRef = models.usersRef
            .doc(GetIt.I<AuthChangeNotifier>().id)
            .categories
            .whereParentCategoryId(isEqualTo: category.id)
            .orderByTitle();

        return Scaffold(
          appBar: AppBar(
            title: Text(category.title),
            actions: [
              IconButton(
                color: deleteColor,
                onPressed: () => showConfirmDialog(
                    context: context,
                    title: localizations.areYouSure,
                    description:
                        Text(localizations.deleteCategoryConfirmationMsg),
                    onOkPressed: () {
                      context.pop();
                      _delete(category.title);
                    }),
                icon: _deleting
                    ? SizedBox(
                        width: IconSize.md,
                        height: IconSize.md,
                        child: CircularProgressIndicator(
                          color: deleteColor,
                        ),
                      )
                    : const Icon(
                        Icons.delete_forever_rounded,
                      ),
              ),
            ],
          ),
          backgroundColor: bgColor,
          floatingActionButton: Theme(
            data: Theme.of(context).copyWith(
              floatingActionButtonTheme: surfaceVariantFabThemeData(context),
            ),
            child: FloatingActionButton(
              onPressed: () => _showCreateSubcategoryDialog(category),
              child: const Icon(
                Icons.add_rounded,
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        left: PaddingSize.md,
                        right: PaddingSize.md,
                        bottom: PaddingSize.md,
                        top: PaddingSize.xxs,
                      ),
                      color: Theme.of(context).colorScheme.background,
                      child: Column(
                        children: [
                          CategoryForm(
                            key: _updateCategoryFormKey,
                            formKey: _updateCategoryFormStateKey,
                            category: category,
                            disableTransactionTypeField: true,
                          ),
                          HeightSpacer.lg,
                          FilledButton(
                            onPressed: () => executeFnIfFormValid(
                              formKey: _updateCategoryFormStateKey,
                              fn: _update,
                            ),
                            child: Text(
                              MaterialLocalizations.of(context).saveButtonLabel,
                            ),
                          )
                              .colorStyle(FilledButtonStyles.primaryContainer)
                              .loadingBtn(
                                constructor: FilledButton.new,
                                isLoading: _updating,
                                colorStyle: FilledButtonStyles.primaryContainer,
                              ),
                        ],
                      ),
                    ),
                    HeightSpacer.lg,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: PaddingSize.md,
                      ),
                      child: Text(
                        localizations.subcategories,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: fgColor,
                            ),
                      ),
                    ),
                    HeightSpacer.lg,
                  ],
                ),
                CategoriesListView(
                  ref: subcategoriesRef,
                  scrollController: _scrollController,
                  foregroundColor: fgColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
