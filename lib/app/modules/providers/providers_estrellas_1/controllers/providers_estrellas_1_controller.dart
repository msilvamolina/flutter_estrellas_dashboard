import 'package:estrellas_dashboard/app/data/models/provider/provider/provider_model.dart';
import 'package:estrellas_dashboard/app/data/providers/repositories/providers/providers_repository.dart';
import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';

class ProvidersEstrellas1Controller extends GetxController {
  late ProviderModel provider;
  final MainController _mainController = Get.find<MainController>();
  final ProvidersRepository _repository = ProvidersRepository();
  @override
  void onInit() {
    provider = Get.arguments as ProviderModel;
    super.onInit();
  }

  Future<void> copyToFirebase() async {
    _mainController.showLoader();

    // Either<String, Unit> response = await _repository.saveProductInFirebase(
    //   product: product,
    // );
    // Get.back();
    // response.fold((failure) {
    //   Get.snackbar("Error", failure);
    //   update(['view']);
    // }, (_) {
    //   Get.back();
    //   Get.snackbar(product.name, "Guardado exitosamente");
    // });
  }
}
