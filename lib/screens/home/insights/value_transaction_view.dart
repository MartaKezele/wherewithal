import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../app_models/action_result.dart';
import '../../../change_notifiers/auth.dart';
import '../../../components/dialogs/confirm_dialog.dart';
import '../../../components/error_content.dart';
import '../../../components/form/value_transaction_form.dart';
import '../../../components/loading_content.dart';
import '../../../components/no_data_content.dart';
import '../../../constants/icon_size.dart';
import '../../../constants/padding_size.dart';
import '../../../constants/spacers.dart';
import '../../../constants/styles/filled_button.dart';
import '../../../constants/styles/outlined_button.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/models.dart' as models;
import '../../../utils/form.dart';
import '../../../utils/overlay_banner.dart';
import '../../../extensions/button/button_style_button.dart';
import '../../../extensions/button/filled_button.dart';
import '../../../utils/value_transaction.dart';
import '../../../extensions/button/outlined_button.dart';

class ValueTransactionView extends StatefulWidget {
  const ValueTransactionView({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<ValueTransactionView> createState() => _ValueTransactionViewState();
}

class _ValueTransactionViewState extends State<ValueTransactionView> {
  final _updateValueTransactionFormKey = GlobalKey<ValueTransactionFormState>();
  final _updateValueTransactionFormStateKey = GlobalKey<FormState>();
  final _addTransactionFormKey = GlobalKey<ValueTransactionFormState>();
  final _addTransactionFormStateKey = GlobalKey<FormState>();

  bool _deleting = false;
  bool _updating = false;
  OverlayEntry? _resultBanner;

  Future<void> _delete(String? transactionTitle) async {
    final localizations = AppLocalizations.of(context);

    setState(() {
      _deleting = true;
    });

    try {
      models.usersRef
          .doc(GetIt.I<AuthChangeNotifier>().id)
          .valueTransactions
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
            messageTitle: transactionTitle != null
                ? localizations.deletedTransactionWithTitle(transactionTitle)
                : localizations.deletedTransaction,
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
          messageTitle: transactionTitle != null
              ? localizations
                  .couldNotDeleteTransactionWithTitle(transactionTitle)
              : localizations.couldNotCreateTransaction,
        ),
      );
    }
  }

  Future<void> _update() async {
    setState(() {
      _updating = true;
    });

    await _updateValueTransactionFormKey.currentState
        ?.updateValueTransaction()
        .then((result) {
      setState(() {
        _updating = false;
      });
      _resultBanner = showActionResultOverlayBanner(context, result);
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

    return FirestoreBuilder(
      ref: models.usersRef
          .doc(GetIt.I<AuthChangeNotifier>().id)
          .valueTransactions
          .doc(widget.id),
      builder: (
        context,
        snapshot,
        child,
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

        final valueTransaction = snapshot.requireData.data;

        if (valueTransaction == null) {
          return Scaffold(
            appBar: AppBar(
              title: Text(localizations.noData),
            ),
            body: const NoDataContent(),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title:
                Text(valueTransaction.title ?? valueTransaction.categoryTitle),
            actions: [
              IconButton(
                color: deleteColor,
                onPressed: () => showConfirmDialog(
                    context: context,
                    title: localizations.areYouSure,
                    onOkPressed: () {
                      context.pop();
                      _delete(valueTransaction.title);
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
          body: SingleChildScrollView(
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
                          ValueTransactionForm(
                            key: _updateValueTransactionFormKey,
                            formKey: _updateValueTransactionFormStateKey,
                            valueTransaction: valueTransaction,
                          ),
                          HeightSpacer.xs,
                          FilledButton(
                            onPressed: () => executeFnIfFormValid(
                              formKey: _updateValueTransactionFormStateKey,
                              fn: _update,
                            ),
                            child: Text(localizations.save),
                          )
                              .colorStyle(FilledButtonStyles.primaryContainer)
                              .loadingBtn(
                                constructor: FilledButton.new,
                                isLoading: _updating,
                                colorStyle: FilledButtonStyles.primaryContainer,
                              ),
                          if (valueTransaction.recurrenceInterval != null)
                            Padding(
                              padding: const EdgeInsets.only(
                                top: PaddingSize.xs,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  OutlinedButton(
                                    onPressed: () {
                                      addValueTransaction(
                                        context: context,
                                        addTransactionFormKey:
                                            _addTransactionFormKey,
                                        addTransactionFormStateKey:
                                            _addTransactionFormStateKey,
                                        valueTransaction:
                                            models.ValueTransaction(
                                          id: '',
                                          title: valueTransaction.title,
                                          dateTime: DateTime.now(),
                                          value: valueTransaction.value,
                                          categoryId:
                                              valueTransaction.categoryId,
                                          categoryTitle:
                                              valueTransaction.categoryTitle,
                                          categoryTransactionType:
                                              valueTransaction
                                                  .categoryTransactionType,
                                          categoryReason:
                                              valueTransaction.categoryReason,
                                          parentCategoryId:
                                              valueTransaction.parentCategoryId,
                                          recurrenceInterval: valueTransaction
                                              .recurrenceInterval,
                                        ),
                                        allowRecurring: false,
                                      );
                                    },
                                    child: Text(localizations.add),
                                  ).colorStyle(OutlinedButtonStyles.primary),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
