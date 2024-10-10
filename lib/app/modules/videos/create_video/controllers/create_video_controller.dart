import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

enum Fields {
  videoName('videoName');

  const Fields(this.name);
  final String name;
}

class CreateVideoController extends GetxController {
  FormGroup buildForm() => fb.group(<String, Object>{
        Fields.videoName.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(6),
          ],
        ),
      });

  bool _loading = false;
  bool get loading => _loading;

  Future<void> sendForm(Map<String, Object?> data) async {
    _loading = true;

    update(['view']);

    String user = data[Fields.videoName.name].toString();

    Map<String, String> body = {
      "user": user,
    };

    // Response? response =
    //     await apiRepository.testApiEndpointPost(url: url, body: body);

    _loading = false;
  }
}
