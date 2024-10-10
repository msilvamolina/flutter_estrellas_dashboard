import 'package:estrellas_dashboard/app/data/models/videos/video_post_model.dart';
import 'package:get/get.dart';

class VideosDetailsController extends GetxController {
  late VideoPostModel videoPostModel;

  @override
  void onInit() {
    videoPostModel = Get.arguments as VideoPostModel;
    super.onInit();
  }
}
