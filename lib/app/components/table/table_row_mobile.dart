import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'models/table_row_model.dart';

class TableRowMobile extends StatelessWidget {
  const TableRowMobile({required this.border, required this.row, super.key});

  final Color border;
  final TableRowModel row;

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).colorScheme.primary;

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
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              row.label,
              style: TypographyStyle.bodyBlackSmall.copyWith(color: primary),
            ),
          ),
          row.widget,
        ],
      ),
    );
  }
}
