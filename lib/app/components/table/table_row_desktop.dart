import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:estrellas_dashboard/app/utils/responsive.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'models/table_row_model.dart';

class TableRowDesktop extends StatelessWidget {
  const TableRowDesktop({required this.border, required this.row, super.key});

  final Color border;
  final TableRowModel row;
  @override
  Widget build(BuildContext context) {
    bool isTablet = Responsive.isTablet(context);
    Color primary = Theme.of(context).colorScheme.primary;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: border, width: 1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: !isTablet ? 160 : 120,
            padding: const EdgeInsets.all(16),
            child: Text(
              row.label,
              style: TypographyStyle.bodyBlackMedium.copyWith(color: primary),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: border, width: 1),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: row.widget,
            ),
          ),
        ],
      ),
    );
  }
}
