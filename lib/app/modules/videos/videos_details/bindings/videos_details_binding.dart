import 'package:get/get.dart';

import '../controllers/videos_details_controller.dart';

class VideosDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideosDetailsController>(
      () => VideosDetailsController(),
    );
  }
}
