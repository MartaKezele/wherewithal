import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../change_notifiers/date_format.dart';
import '../../../config/date_time_picker.dart';
import '../../../l10n/app_localizations.dart';
import '../../../utils/form_field_validators.dart';

class DateFormField extends StatefulWidget with GetItStatefulWidgetMixin {
  DateFormField({
    super.key,
    required this.setDateTime,
    this.dateTime,
    this.required = false,
  });

  final void Function(DateTime? dateTime) setDateTime;
  final DateTime? dateTime;
  final bool required;

  @override
  State<DateFormField> createState() => _DateFormFieldState();
}

class _DateFormFieldState extends State<DateFormField> with GetItStateMixin {
  late final TextEditingController _dateTimeController;

  final initialDate = DateTime.now();

  @override
  void initState() {
    _dateTimeController = TextEditingController(
      text: GetIt.I<DateFormatChangeNotifier>().dateFormat?.format(
            widget.dateTime ?? initialDate,
          ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final dateFormat = watchOnly(
      (DateFormatChangeNotifier changeNotifier) => changeNotifier.dateFormat,
    );

    return TextFormField(
      controller: _dateTimeController,
      decoration: InputDecoration(
        label: Text('${localizations.date}${widget.required ? '*' : ''}'),
      ),
      validator: widget.required == true
          ? (_) => requiredDateTimeValidator(
                widget.dateTime,
                AppLocalizations.of(
                  context,
                ),
              )
          : null,
      keyboardType: TextInputType.none,
      showCursor: false,
      onTap: () async {
        final dateTime = await showDatePicker(
          context: context,
          initialDate: widget.dateTime ?? initialDate,
          firstDate: firstDate,
          lastDate: endOfDay(DateTime.now()),
        );
        setState(() {
          _dateTimeController.text = (dateTime == null || dateFormat == null)
              ? ''
              : dateFormat.format(dateTime);
        });
        widget.setDateTime(dateTime);
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
