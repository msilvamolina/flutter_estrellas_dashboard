import 'package:cached_network_image/cached_network_image.dart';
import 'package:estrellas_dashboard/app/components/table/table_row_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../../utils/responsive.dart';

class TableRowImage extends StatelessWidget {
  const TableRowImage({required this.url, super.key});

  final String url;
  @override
  Widget build(BuildContext context) {
    return !Responsive.isMobile(context)
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 320,
                width: 180,
                child: CachedNetworkImage(imageUrl: url),
              ),
              const SizedBox(width: 8),
              Expanded(child: TableRowText(text: url)),
            ],
          )
        : Column(
            children: [
              TableRowText(text: url),
              const SizedBox(height: 8),
              AspectRatio(
                aspectRatio: 9 / 16,
                child: CachedNetworkImage(imageUrl: url),
              ),
            ],
          );
  }
}
