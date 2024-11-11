import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/data/models/city/department/department.dart';
import 'package:get/get.dart';

import '../../../../data/providers/repositories/selects/select_city_repository.dart';

class CopyDepartmentsController extends GetxController {
  final SelectCityRepository _repository = SelectCityRepository();
  final List<DepartmentModel> _data = <DepartmentModel>[];
  List<DepartmentModel> get data => _data;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String? _responseError;
  String? get responseError => _responseError;

  final RxList<DepartmentModel> _list = <DepartmentModel>[].obs;
  List<DepartmentModel> get list => _list.toList();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getDataVersion1() async {
    _isLoading = true;
    _responseError = null;
    _data.clear();
    update(['tab1View']);

    Either<String, List<DepartmentModel>> response =
        await _repository.getDepartments();
    _isLoading = false;

    response.fold((error) {
      _responseError = error;
    }, (list) {
      _data.addAll(list);
    });
    update(['tab1View']);
  }
}
