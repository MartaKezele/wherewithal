import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../change_notifiers/date_format.dart';
import '../../../config/date_time_picker.dart';
import '../../../l10n/app_localizations.dart';
import '../../../utils/form_field_validators.dart';

class DateFormField extends StatelessWidget with GetItMixin {
  DateFormField({
    super.key,
    required this.setDateTime,
    this.dateTime,
    this.required = false,
  });

  final void Function(DateTime? dateTime) setDateTime;
  final DateTime? dateTime;
  final bool required;

  final initialDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final dateFormat = watchOnly(
      (DateFormatChangeNotifier changeNotifier) => changeNotifier.dateFormat,
    );

    final dateTimeText = dateFormat != null && dateTime != null
        ? dateFormat.format(dateTime!)
        : '';

    return TextFormField(
      controller: TextEditingController(
        text: dateTimeText,
      ),
      decoration: InputDecoration(
        label: Text('${localizations.date}${required ? '*' : ''}'),
      ),
      validator: required == true
          ? (_) => requiredDateTimeValidator(
                dateTime,
                AppLocalizations.of(
                  context,
                ),
              )
          : null,
      keyboardType: TextInputType.none,
      showCursor: false,
      onTap: () async {
        final pickedDateTime = await showDatePicker(
          context: context,
          initialDate: dateTime ?? initialDate,
          firstDate: firstDate,
          lastDate: endOfDay(DateTime.now()),
        );
        setDateTime(pickedDateTime);
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
