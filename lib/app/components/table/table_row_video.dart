import 'package:flutter/widgets.dart';

import '../video/video_widget.dart';

class TableRowVideo extends StatelessWidget {
  const TableRowVideo({required this.url, super.key});

  final String url;

  @override
  Widget build(BuildContext context) {
    return VideoWidget(videoUrl: url);
  }
}
