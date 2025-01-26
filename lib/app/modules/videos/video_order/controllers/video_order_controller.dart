import 'package:get/get.dart';

import '../../../../data/models/videos/video_post_model.dart';
import '../../../../data/providers/local/local_storage.dart';
import '../../../../data/providers/repositories/videos/videos_repository.dart';

class VideoOrderController extends GetxController {
  final VideosRepository _repository = VideosRepository();
  LocalStorage localStorage = Get.find<LocalStorage>();

  final RxList<VideoPostModel> _list = <VideoPostModel>[].obs;
  List<VideoPostModel> get list => _list.toList();

  bool _listChanged = false;
  bool get listChanged => _listChanged;

  bool _buttonSaveLoading = false;
  bool get buttonSaveLoading => _buttonSaveLoading;

  List<String> _newOrderList = [];
  @override
  void onInit() {
    _list.bindStream(_repository.getVideos());
    super.onInit();
  }

  void onListChanged(List<String> list) {
    _listChanged = true;
    _newOrderList.clear();
    _newOrderList.addAll(list);
    update(['list_changed']);
  }

  VideoPostModel? getVideoByImage(String imageUrl) {
    VideoPostModel? option =
        _list.firstWhereOrNull((element) => element.thumbnail == imageUrl);

    return option;
  }

  Future<void> saveNewOrder() async {
    _buttonSaveLoading = true;
    update(['list_changed']);

    for (int index = 0; index < _list.length; index++) {
      VideoPostModel? option = getVideoByImage(_newOrderList[index]);

      if (option != null) {
        String videoId = option.id;
        await _repository.updateVideoOrder(
          videoId: videoId,
          order: index,
        );
      }
    }
    _buttonSaveLoading = false;
    update(['list_changed']);
    Get.snackbar('Guardado', 'nuevo orden guardado correctamente');
  }
}
