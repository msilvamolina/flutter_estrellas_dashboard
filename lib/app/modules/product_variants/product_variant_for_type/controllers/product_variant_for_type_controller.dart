import 'package:get/get.dart';

enum VariantsTypes {
  color('color'),
  size('size');

  const VariantsTypes(this.text);
  final String text;
}

class ProductVariantForTypeController extends GetxController {
  late VariantsTypes typeSelected;
  @override
  void onInit() {
    typeSelected = Get.arguments as VariantsTypes;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
