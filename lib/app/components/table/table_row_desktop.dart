import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'model/table_row_model.dart';

class TableRowDesktop extends StatelessWidget {
  const TableRowDesktop({required this.border, required this.row, super.key});

  final Color border;
  final TableRowModel row;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: border, width: 1),
              bottom: BorderSide(color: border, width: 1),
            ),
          ),
          width: 160,
          padding: const EdgeInsets.all(16),
          child: Text(row.label),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: border, width: 1),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: row.widget,
          ),
        ),
      ],
    );
  }
}
