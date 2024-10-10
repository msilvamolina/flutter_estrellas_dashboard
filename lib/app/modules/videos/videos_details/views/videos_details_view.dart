import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/videos_details_controller.dart';

class VideosDetailsView extends GetView<VideosDetailsController> {
  const VideosDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentRoute: Routes.VIDEOS_DETAILS,
      appBarTitle: 'Video Details',
      child: GetBuilder<VideosDetailsController>(
        id: 'view',
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.videoPostModel.toString(),
              )
            ],
          );
        },
      ),
    );
  }
}
