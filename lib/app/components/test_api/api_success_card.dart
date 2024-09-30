import 'package:estrellas_dashboard/app/components/utils/row_or_column.dart';
import 'package:flutter/material.dart';

import '../../utils/responsive.dart';
import '../utils/widget_or_widget.dart';
import 'api_card.dart';
import 'success_card.dart';

class ApiSuccessCard extends StatelessWidget {
  const ApiSuccessCard({
    required this.url,
    required this.success,
    required this.statusCode,
    super.key,
  });
  final String url;
  final String success;
  final String statusCode;

  @override
  Widget build(BuildContext context) {
    bool breakingPoint = !Responsive.isMobile(context);
    return RowOrColumn(
      breakingPoint: breakingPoint,
      children: [
        ApiCard(url: url),
        WidgetOrWidget(
          breakingPoint: breakingPoint,
          secondChild: const SizedBox(height: 8),
          child: const Spacer(),
        ),
        if (success != 'null')
          SuccessCard(
            success: success,
            statusCode: statusCode,
          ),
      ],
    );
  }
}
