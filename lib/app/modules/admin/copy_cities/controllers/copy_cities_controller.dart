import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/data/models/city/city/city.dart';
import 'package:estrellas_dashboard/app/data/models/city/department/department.dart';
import 'package:get/get.dart';

import '../../../../data/providers/repositories/selects/select_city_repository.dart';

class CopyCitiesController extends GetxController {
  final SelectCityRepository _repository = SelectCityRepository();
  final List<CityModel> _data = <CityModel>[];
  List<CityModel> get data => _data;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String? _responseError;
  String? get responseError => _responseError;

  final RxList<CityModel> _list = <CityModel>[].obs;
  List<CityModel> get list => _list.toList();

  late DepartmentModel departmentModel;
  @override
  void onInit() {
    departmentModel = Get.arguments as DepartmentModel;
    super.onInit();
  }

  Future<void> copyToFirebase() async {
    // if (_data.isNotEmpty) {
    //   for (DepartmentModel element in _data) {
    //     await _repository.saveDepartmentInFirebase(department: element);
    //   }
    // }
  }

  Future<void> getDataVersion1() async {
    _isLoading = true;
    _responseError = null;
    _data.clear();
    update(['tab1View']);

    Either<String, List<CityModel>> response =
        await _repository.getCities(departmentModel.dropiId);
    _isLoading = false;

    response.fold((error) {
      _responseError = error;
    }, (list) {
      _data.addAll(list);
    });
    update(['tab1View']);
  }
}
