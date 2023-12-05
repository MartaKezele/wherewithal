import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../change_notifiers/currency.dart';
import '../../../constants/padding_size.dart';
import '../../../l10n/app_localizations.dart';
import '../../../models/enums/transaction_types.dart';
import '../../../utils/form_field_validators.dart';

class PriceValueFormField extends StatelessWidget with GetItMixin {
  PriceValueFormField({
    super.key,
    required this.controller,
    required this.transactionType,
  });

  final TextEditingController controller;
  final TransactionTypes? transactionType;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final currencySymbol = watchOnly(
      (CurrencyChangeNotifier changeNotifier) =>
          changeNotifier.currency?.symbol,
    );

    final valuePrefixSuffixTextStyle =
        Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w900,
              color: transactionType?.foregroundColor(context),
            );

    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        label: Text('${localizations.value}*'),
        prefix: Container(
          padding: const EdgeInsets.only(
            right: PaddingSize.xxs,
          ),
          child: Text(
            transactionType?.operand ?? '',
            style: valuePrefixSuffixTextStyle,
          ),
        ),
        suffix: Container(
          padding: const EdgeInsets.only(
            left: PaddingSize.xxs,
          ),
          child: Text(
            '$currencySymbol',
            style: valuePrefixSuffixTextStyle,
          ),
        ),
      ),
      validator: (value) => requiredDoubleValidator(
        value,
        AppLocalizations.of(
          context,
        ),
      ),
    );
  }
}
