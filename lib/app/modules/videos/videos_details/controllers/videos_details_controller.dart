import 'package:estrellas_dashboard/app/data/models/videos/video_post_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class VideosDetailsController extends GetxController {
  late VideoPostModel videoPostModel;

  @override
  void onInit() {
    videoPostModel = Get.arguments as VideoPostModel;
    super.onInit();
  }

  Future<void> pickVideo() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (video != null) {}
  }
}
