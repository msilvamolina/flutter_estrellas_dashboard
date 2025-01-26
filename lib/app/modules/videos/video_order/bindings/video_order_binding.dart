import 'package:get/get.dart';

import '../controllers/video_order_controller.dart';

class VideoOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoOrderController>(
      () => VideoOrderController(),
    );
  }
}
