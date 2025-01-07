import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/data/models/provider/provider/provider_model.dart';
import 'package:estrellas_dashboard/app/data/providers/repositories/providers/providers_repository.dart';
import 'package:get/get.dart';

class SelectProviderController extends GetxController {
  final ProvidersRepository _repository = ProvidersRepository();
  final List<ProviderModel> _data = <ProviderModel>[];
  List<ProviderModel> get data => _data;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String? _responseError;
  String? get responseError => _responseError;

  bool? editMode;
  String? providerID;

  @override
  void onInit() {
    if (Get.arguments != null) {
      editMode = Get.arguments[0];
      providerID = Get.arguments[1];
    }
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await getData();

    super.onReady();
  }

  void onTap(ProviderModel provider) {
    // Get.back(result: city);
  }

  Future<void> getData() async {
    Either<String, List<ProviderModel>> response =
        await _repository.getProvidersFromBackend();
    _isLoading = false;

    response.fold((error) {
      _responseError = error;
    }, (list) {
      _data.clear();

      if (editMode != null && editMode == true && providerID != null) {
        // Agrega solo el elemento que cumple con el providerID
        final matchingProvider = list.firstWhereOrNull(
          (provider) => provider.id == providerID,
        );

        if (matchingProvider != null) {
          _data.add(matchingProvider);
        }
      } else {
        _data.addAll(list);
      }
    });

    update(['view']);
  }
}
