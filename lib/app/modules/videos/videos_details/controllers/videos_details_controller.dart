import 'package:estrellas_dashboard/app/app/controllers/main_controller.dart';
import 'package:estrellas_dashboard/app/data/models/videos/video_post_model.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/providers/local/local_storage.dart';
import '../../../../data/providers/repositories/videos/videos_repository.dart';

class VideosDetailsController extends GetxController {
  late VideoPostModel videoPostModel;
  final VideosRepository _repository = VideosRepository();
  final MainController _mainController = Get.find<MainController>();
  LocalStorage localStorage = Get.find<LocalStorage>();

  @override
  void onInit() {
    videoPostModel = Get.arguments as VideoPostModel;
    super.onInit();
  }

  @override
  void onReady() {
    openGuideTour();
  }

  String guideTourName = 'feature_video_details';
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
                leading: const Icon(Icons.edit),
                title: const Text('Actualizar producto'),
                onTap: () {
                  Get.back();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
