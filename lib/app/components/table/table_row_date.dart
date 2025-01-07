import 'package:flutter/material.dart';

import '../../utils/datetime_formatters.dart';

class TableRowDate extends StatelessWidget {
  const TableRowDate({required this.date, super.key});

  final String? date;
  @override
  Widget build(BuildContext context) {
    DateTime? dateTime;
    String? dateWithFormat;
    if (date != null) {
      dateTime = DateTime.tryParse(date!);
      dateWithFormat = DateTimeFormatter.getDateWithMonthAndTime(dateTime!);
    }

    return date != null
        ? Wrap(
            children: [
              SelectableText(dateWithFormat!),
              Text(' -  '),
              SelectableText(date!),
            ],
          )
        : Text('(Vacío)');
  }
}
