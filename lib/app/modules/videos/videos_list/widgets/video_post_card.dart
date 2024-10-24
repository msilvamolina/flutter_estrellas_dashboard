import 'package:cached_network_image/cached_network_image.dart';
import 'package:estrellas_dashboard/app/data/models/videos/video_post_model.dart';
import 'package:estrellas_dashboard/app/routes/app_pages.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                videoPostModel.name,
                style: TypographyStyle.h4Mobile,
              ),
              const SizedBox(height: 8),
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  text: 'Creado por: ',
                  style: TypographyStyle.bodyBlackLarge,
                  children: <TextSpan>[
                    TextSpan(
                      text: videoPostModel.createdByEmail,
                      style: TypographyStyle.bodyRegularMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              CachedNetworkImage(imageUrl: videoPostModel.thumbnail)
            ],
          ),
        ),
      ),
    );
  }
}
