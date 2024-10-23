import 'package:flutter/material.dart';
import 'package:estrellas_dashboard/app/data/models/video_model.dart';
import 'package:estrellas_dashboard/app/modules/home/components/video.dart';
import 'package:estrellas_dashboard/app/modules/home/components/video_label.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    required this.videoModel,
    required this.onCompleted,
    super.key,
  });

  final VideoModel videoModel;
  final Function() onCompleted;

  @override
  Widget build(BuildContext context) {
    return VideoApp(
      videoModel: videoModel,
      onCompleted: onCompleted,
    );
  }
}
