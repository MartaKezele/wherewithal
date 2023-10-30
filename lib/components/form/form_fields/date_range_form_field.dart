import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';

import '../../../change_notifiers/date_format.dart';
import '../../../config/date_time_picker.dart';
import '../../../l10n/app_localizations.dart';
import '../../../utils/form_field_validators.dart';

class DateRangeFormField extends StatefulWidget with GetItStatefulWidgetMixin {
  DateRangeFormField({
    super.key,
    required this.setDateTimeRange,
    this.dateTimeRange,
    this.required = false,
  });

  final void Function(DateTimeRange? dateTimeRange) setDateTimeRange;
  final DateTimeRange? dateTimeRange;
  final bool required;

  @override
  State<DateRangeFormField> createState() => _DateFormFieldState();
}

class _DateFormFieldState extends State<DateRangeFormField>
    with GetItStateMixin {
  late final TextEditingController _dateTimeController;

  String dateTimeRangeString(
    DateFormat? dateFormat,
    DateTimeRange? dateTimeRange,
  ) {
    if (dateTimeRange == null) {
      return '';
    }
    return '${dateFormat?.format(dateTimeRange.start)} - ${dateFormat?.format(dateTimeRange.end)}';
  }

  @override
  void initState() {
    final dateFormat = GetIt.I<DateFormatChangeNotifier>().dateFormat;
    _dateTimeController = TextEditingController(
      text: dateTimeRangeString(dateFormat, widget.dateTimeRange),
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
        label: Text(localizations.dateRange),
      ),
      validator: widget.required
          ? (_) => requiredDateTimeRangeValidator(
                widget.dateTimeRange,
                AppLocalizations.of(
                  context,
                ),
              )
          : null,
      keyboardType: TextInputType.none,
      showCursor: false,
      onTap: () async {
        final dateTimeRange = await showDateRangePicker(
          context: context,
          initialDateRange: widget.dateTimeRange,
          firstDate: firstDate,
          lastDate: endOfThisWeek(),
        );
        DateTimeRange? adjustedDateTimeRange;

        if (dateTimeRange != null) {
          // Date range needs to be adjusted
          // so that start date is at the beginning of the day,
          // and end day is at the end of the day
          adjustedDateTimeRange = DateTimeRange(
            start: dateTimeRange.start,
            end: endOfDay(dateTimeRange.end),
          );
        }

        setState(() {
          _dateTimeController.text = dateTimeRangeString(
            dateFormat,
            adjustedDateTimeRange,
          );
        });
        widget.setDateTimeRange(adjustedDateTimeRange);
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
