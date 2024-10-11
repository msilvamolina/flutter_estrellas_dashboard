import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/video/video_widget.dart';
import '../../../../components/widgets/loadingButton.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/styles/typography.dart';
import '../controllers/videos_details_controller.dart';

class VideosDetailsView extends GetView<VideosDetailsController> {
  const VideosDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      showMenu: false,
      currentRoute: Routes.VIDEOS_DETAILS,
      appBarTitle: 'Video Details',
      child: GetBuilder<VideosDetailsController>(
        id: 'view',
        builder: (_) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.videoPostModel.name,
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
                        text: controller.videoPostModel.createdByEmail,
                        style: TypographyStyle.bodyRegularMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                VideoWidget(videoUrl: controller.videoPostModel.videoUrl),
                const SizedBox(height: 80),
              ],
            ),
          );
        },
      ),
    );
  }
}
