import 'package:get/get.dart';

import '../../../data/models/product/product_firebase/product_firebase_model.dart';

class NewVariationsPickersController extends GetxController {
  late ProductFirebaseModel product;

  @override
  void onInit() {
    product = Get.arguments as ProductFirebaseModel;
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

  void saveSelections(
      List<Map<String, String>>? tags, List<Map<String, String>>? colors) {
    print('tags $tags');
    print('colors $colors');
  }
}
