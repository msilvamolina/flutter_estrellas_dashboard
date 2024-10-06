import 'package:estrellas_dashboard/app/components/table/table_row_mobile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../../utils/responsive.dart';
import '../utils/widget_or_widget.dart';
import 'model/table_row_model.dart';
import 'table_row_desktop.dart';

class TableWidgetRow extends StatelessWidget {
  const TableWidgetRow({required this.border, required this.row, super.key});

  final Color border;
  final TableRowModel row;
  @override
  Widget build(BuildContext context) {
    return WidgetOrWidget(
      breakingPoint: Responsive.isTablet2(context),
      secondChild: TableRowDesktop(
        border: border,
        row: row,
      ),
      child: TableRowMobile(
        border: border,
        row: row,
      ),
    );
  }
}
