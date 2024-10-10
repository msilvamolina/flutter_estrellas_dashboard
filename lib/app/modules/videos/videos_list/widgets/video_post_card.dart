import 'package:estrellas_dashboard/app/data/models/videos/video_post_model.dart';
import 'package:estrellas_dashboard/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoPostCard extends StatelessWidget {
  const VideoPostCard({
    required this.videoPostModel,
    super.key,
  });

  final VideoPostModel videoPostModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => Get.toNamed(
          Routes.VIDEOS_DETAILS,
          arguments: videoPostModel,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            videoPostModel.toString(),
          ),
        ),
      ),
    );
  }
}
