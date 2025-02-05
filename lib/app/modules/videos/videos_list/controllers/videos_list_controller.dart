import 'package:estrellas_dashboard/app/data/models/videos/video_post_model.dart';
import 'package:estrellas_dashboard/app/data/providers/repositories/videos/videos_repository.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/providers/local/local_storage.dart';
import '../../../../routes/app_pages.dart';

class VideosListController extends GetxController {
  final VideosRepository _repository = VideosRepository();
  LocalStorage localStorage = Get.find<LocalStorage>();

  final RxList<VideoPostModel> _list = <VideoPostModel>[].obs;
  List<VideoPostModel> get list => _list.toList();

  @override
  void onInit() {
    _list.bindStream(_repository.getVideos());
    super.onInit();
  }

  @override
  void onReady() {
    openGuideTour();
  }

  void goToCreatevideo() {
    Get.toNamed(Routes.CREATE_VIDEO, arguments: list.length);
  }

  String guideTourName = 'feature_video_order';
  Future<void> openGuideTour() async {
    bool userWantToSee = await localStorage.getGuideTourStatus(guideTourName);

    if (userWantToSee) {
      await FeatureDiscovery.clearPreferences(Get.context!, [
        guideTourName,
      ]);
      FeatureDiscovery.discoverFeatures(
        Get.context!,
        [guideTourName],
      );
    }
  }

  Future<void> moreOptions() async {
    await showDialog<String>(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.low_priority_rounded),
                title: const Text('Ordenar videos'),
                onTap: () {
                  Get.back();
                  Get.toNamed(
                    Routes.VIDEO_ORDER,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
