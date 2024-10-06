import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'model/table_row_model.dart';

class TableRowMobile extends StatelessWidget {
  const TableRowMobile({required this.border, required this.row, super.key});

  final Color border;
  final TableRowModel row;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: border, width: 1),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            row.label,
            style: TypographyStyle.bodyBlackSmall,
          ),
          row.widget,
        ],
      ),
    );
  }
}
