import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../data/models/provider/provider/provider_model.dart';
import '../../../../data/providers/repositories/providers/providers_repository.dart';
import '../../../../routes/app_pages.dart';

class ProvidersWarehousesController extends GetxController {
  late ProviderModel provider;
  final MainController _mainController = Get.find<MainController>();
  final ProvidersRepository _repository = ProvidersRepository();
  @override
  void onInit() {
    provider = Get.arguments as ProviderModel;
    super.onInit();
  }

  Future<void> addWarehouse() async {
    final result =
        await Get.toNamed(Routes.CREATE_WAREHOUSE, arguments: provider);
    if (result != null) {
      provider = result;
      update(['view']);
    }
  }

  Future<void> copyToFirebase() async {
    _mainController.showLoader();
  }
}
