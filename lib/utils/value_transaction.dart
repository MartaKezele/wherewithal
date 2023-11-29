import 'package:flutter/material.dart';

import '../components/dialogs/scrollable_form_dialog.dart';
import '../components/form/value_transaction_form.dart';
import '../l10n/app_localizations.dart';
import '../models/enums/transaction_types.dart';
import '../models/models.dart' as models;
import 'overlay_banner.dart';

void addValueTransaction({
  required BuildContext context,
  required GlobalKey<ValueTransactionFormState> addTransactionFormKey,
  required GlobalKey<FormState> addTransactionFormStateKey,
  OverlayEntry? resultBanner,
  TransactionTypes? transactionType,
  models.ValueTransaction? valueTransaction,
  bool allowRecurring = true,
}) async {
  await showScrollableFormDialog(
    context: context,
    title: AppLocalizations.of(context).addTransaction,
    form: ValueTransactionForm(
      key: addTransactionFormKey,
      formKey: addTransactionFormStateKey,
      transactionType: transactionType,
      valueTransaction: valueTransaction,
      allowRecurring: allowRecurring,
    ),
    onSubmit: () {
      assert(addTransactionFormKey.currentState != null);
      return addTransactionFormKey.currentState!.addValueTransaction();
    },
    submitBtnText: AppLocalizations.of(context).save,
    formKey: addTransactionFormStateKey,
  ).then((result) {
    if (result != null) {
      resultBanner = showActionResultOverlayBanner(
        context,
        result,
      );
    }
  });
}
