import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../data/providers/repositories/api_test_repository.dart';
import 'package:http/http.dart';

enum Fields {
  user('user'),
  password('password');

  const Fields(this.name);
  final String name;
}

class TestLoginAppDropiController extends GetxController {
  ApiTestRepository apiRepository = ApiTestRepository();
  String url = 'api/users/login/';

  FormGroup buildForm() => fb.group(<String, Object>{
        Fields.user.name: FormControl<String>(
          value: '1144076614',
          validators: [
            Validators.required,
            Validators.minLength(6),
          ],
        ),
        Fields.password.name: FormControl<String>(
          value: '1144076614',
          validators: [
            Validators.required,
            Validators.minLength(6),
          ],
        ),
      });

  dynamic _result;
  dynamic get result => _result;

  bool? _success;
  bool? get success => _success;

  int? _statusCode;
  int? get statusCode => _statusCode;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> sendForm(Map<String, Object?> data) async {
    _loading = true;
    _result = null;
    _success = null;
    update(['view']);

    String user = data[Fields.user.name].toString();
    String password = data[Fields.password.name].toString();

    Map<String, String> body = {
      "user": user,
      "password": password,
    };

    Response? response =
        await apiRepository.testApiEndpointPost(url: url, body: body);
    _loading = false;

    if (response != null) {
      dynamic decode = json.decode(response.body);
      _result = decode;
      _success = response.statusCode == 200;
      _statusCode = response.statusCode;
      update(['view']);
    }
  }
}
