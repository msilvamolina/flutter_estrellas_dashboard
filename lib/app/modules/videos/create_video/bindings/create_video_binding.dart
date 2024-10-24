import 'package:get/get.dart';

import '../controllers/create_video_controller.dart';

class CreateVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateVideoController>(
      () => CreateVideoController(),
    );
  }
}
