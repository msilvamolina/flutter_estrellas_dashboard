import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../data/providers/repositories/videos/videos_repository.dart';

enum Fields {
  videoName('videoName');

  const Fields(this.name);
  final String name;
}

class CreateVideoController extends GetxController {
  final VideosRepository _repository = VideosRepository();

  FormGroup buildForm() => fb.group(<String, Object>{
        Fields.videoName.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(4),
          ],
        ),
      });

  bool _loading = false;
  bool get loading => _loading;

  Future<void> sendForm(Map<String, Object?> data) async {
    _loading = true;

    update(['view']);

    String videoName = data[Fields.videoName.name].toString();

    Either<String, Unit> response = await _repository.saveVideo(
      name: videoName,
    );

    response.fold((failure) {
      Get.snackbar("Error", failure);
      _loading = false;
      update(['view']);
    }, (_) {
      Get.back();
      Get.snackbar(videoName, "Guardada exitosamente");
    });
  }
}
