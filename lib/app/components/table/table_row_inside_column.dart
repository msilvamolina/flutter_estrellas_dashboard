import 'package:cached_network_image/cached_network_image.dart';
import 'package:estrellas_dashboard/app/utils/responsive.dart';
import 'package:flutter/widgets.dart';

import '../../themes/styles/typography.dart';
import 'models/table_row_strings_model.dart';

class TableRowInsideColumn extends StatelessWidget {
  const TableRowInsideColumn(
      {required this.rows, required this.cellWidth, this.imageUrl, super.key});

  final List<TableRowStringsModel> rows;
  final String? imageUrl;
  final double cellWidth;
  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (imageUrl != null && !isMobile)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CachedNetworkImage(
              width: 80,
              imageUrl: imageUrl!,
            ),
          ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (imageUrl != null && isMobile)
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: CachedNetworkImage(
                    width: 80,
                    imageUrl: imageUrl!,
                  ),
                ),
              for (TableRowStringsModel element in rows)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: cellWidth,
                        child: Text(
                          element.label,
                          style: TypographyStyle.bodyBlackSmall,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          element.text,
                          style: TypographyStyle.bodyRegularSmall,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
