import 'package:flutter/material.dart';

import 'models/table_row_model.dart';
import 'table_row.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({required this.border, required this.rows, super.key});

  final Color border;
  final List<TableRowModel> rows;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: border, width: 1),
      ),
      child: ListView.builder(
        itemCount: rows.length,
        itemBuilder: (context, index) {
          return TableWidgetRow(
            border: border,
            row: rows[index],
          );
        },
      ),
    );
  }
}
