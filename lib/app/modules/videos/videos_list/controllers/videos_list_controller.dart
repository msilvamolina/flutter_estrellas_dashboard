import 'package:estrellas_dashboard/app/data/models/videos/video_post_model.dart';
import 'package:estrellas_dashboard/app/data/providers/repositories/videos/videos_repository.dart';
import 'package:get/get.dart';

class VideosListController extends GetxController {
  final VideosRepository _repository = VideosRepository();

  final RxList<VideoPostModel> _list = <VideoPostModel>[].obs;
  List<VideoPostModel> get list => _list.toList();

  @override
  void onInit() {
    _list.bindStream(_repository.getVideos());
    super.onInit();
  }
}
