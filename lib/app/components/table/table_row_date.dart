import 'package:flutter/material.dart';

import '../../utils/datetime_formatters.dart';

class TableRowDate extends StatelessWidget {
  const TableRowDate({required this.date, super.key});

  final String date;
  @override
  Widget build(BuildContext context) {
    DateTime? dateTime = DateTime.tryParse(date);
    String dateWithFormat =
        DateTimeFormatter.getDateWithMonthAndTime(dateTime!);
    return Wrap(
      children: [
        SelectableText(dateWithFormat),
        Text(' -  '),
        SelectableText(date),
      ],
    );
  }
}
