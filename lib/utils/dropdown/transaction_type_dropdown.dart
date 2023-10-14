import 'package:flutter/material.dart';

import '../../app_models/custom_dropdown_entry.dart';
import '../../models/enums/transaction_types.dart';

CustomDropdownEntry<TransactionTypes> transactionTypeDropdownEntry(
  TransactionTypes transactionType,
  BuildContext context,
) {
  return CustomDropdownEntry(
    value: transactionType,
    title: transactionType.localizedName(context),
    foregroundColor: transactionType.foregroundColor(context),
    backgroundColor: transactionType.backgroundColor(context),
  );
}
