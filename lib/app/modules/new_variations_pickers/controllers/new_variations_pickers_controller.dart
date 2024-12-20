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

  // Nueva función para guardar las selecciones
  void saveSelections(List<String> tags, List<String> colors) {
    // Lógica para manejar los datos seleccionados
    print('tags $tags');
    print('colors $colors');
    // product.tags = tags; // Suponiendo que tienes un campo `tags` en el modelo
    // product.colors = colors; // Suponiendo que tienes un campo `colors`

    // Aquí puedes realizar cualquier acción adicional, como guardar en Firebase
    print('Etiquetas seleccionadas: $tags');
    print('Colores seleccionados: $colors');
  }
}
