import 'package:estrellas_dashboard/app/app/controllers/main_controller.dart';
import 'package:estrellas_dashboard/app/data/models/videos/video_post_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/providers/repositories/videos/videos_repository.dart';

class VideosDetailsController extends GetxController {
  late VideoPostModel videoPostModel;
  final VideosRepository _repository = VideosRepository();
  final MainController _mainController = Get.find<MainController>();
  @override
  void onInit() {
    videoPostModel = Get.arguments as VideoPostModel;
    super.onInit();
  }

  Future<void> pickVideo() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (video != null) {
      _mainController.showLoader();
      await _repository.uploadVideo(videoPostModel.id, video.path);
      Get.back();
    }
  }
}
