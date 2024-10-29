import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../data/models/product/product_firebase/product_firebase_model.dart';
import '../../../../data/models/product_variant/product_variant_model.dart';
import '../../../../data/models/product_variant_combination/product_variant_combination_model.dart';
import '../../../../data/providers/repositories/products/products_repository.dart';
import '../../../../utils/utils.dart';

class ProductVariantCombinationsController extends GetxController {
  final MainController _mainController = Get.find<MainController>();

  final ProductsRepository _repository = ProductsRepository();
  late ProductFirebaseModel product;
  final RxList<ProductVariantModel> _list = <ProductVariantModel>[].obs;
  List<ProductVariantModel> get list => _list.toList();
  final RxList<ProductVariantCombinationModel> _listCombination =
      <ProductVariantCombinationModel>[].obs;
  List<ProductVariantCombinationModel> get listCombination =>
      _listCombination.toList();
  List<String> _newOrderList = [];
  final RxList<ProductVariantModel> sizeList = <ProductVariantModel>[].obs;
  final RxList<ProductVariantModel> colorList = <ProductVariantModel>[].obs;

  @override
  void onInit() {
    product = Get.arguments[0] as ProductFirebaseModel;
    _list.bindStream(_repository.getAllProductVariants(
      productId: product.id,
    ));
    _listCombination.bindStream(_repository.getAllProductVariantsCombinations(
      productId: product.id,
    ));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void filterLists() {
    sizeList.value = _list.where((item) => item.type == "size").toList();
    colorList.value = _list.where((item) => item.type == "color").toList();
  }

  ProductVariantCombinationModel? getBySizeAndColor(
      String? sizeId, String colorId) {
    ProductVariantCombinationModel? option = _listCombination.firstWhereOrNull(
        (element) => element.sizeId == sizeId && element.colorId == colorId);

    return option;
  }

  Future<void> buildCombinations() async {
    filterLists();

    _mainController.setDropiDialog(false);
    _mainController.showDropiLoader();

    for (ProductVariantModel colorElement in colorList) {
      await createCombination(colorElement);
    }
    _mainController.setDropiMessage('Success!');
    Future<void>.delayed(Duration(seconds: 1), () {
      Get.back();
    });
  }

  Future<void> createCombination(ProductVariantModel colorElement) async {
    if (sizeList.isNotEmpty) {
      for (ProductVariantModel sizeElement in sizeList) {
        await saveSizeCombination(sizeElement, colorElement);
      }
    } else {
      await saveSizeCombination(null, colorElement);
    }
  }

  Future<void> saveSizeCombination(ProductVariantModel? sizeElement,
      ProductVariantModel colorElement) async {
    if (getBySizeAndColor(sizeElement?.id, colorElement.id) == null) {
      await saveCombination(sizeElement, colorElement);
    }
  }

  Future<void> saveCombination(ProductVariantModel? sizeElement,
      ProductVariantModel colorElement) async {
    String name =
        Utils.removeNull('${colorElement.name} - ${sizeElement?.name}');
    String label =
        Utils.removeNull('${colorElement.label} - ${sizeElement?.label}');

    _mainController.setDropiMessage('saving $name');

    Either<String, Unit> response = await _repository.saveVariantComination(
      name: name,
      label: label,
      color: colorElement.color,
      imageUrl: colorElement.imageUrl,
      colorId: colorElement.id,
      colorName: colorElement.name,
      colorLabel: colorElement.label,
      sizeId: sizeElement?.id,
      sizeName: sizeElement?.name,
      sizeLabel: sizeElement?.label,
      price: product.price,
      suggestedPrice: product.suggestedPrice,
      points: product.points,
      productId: product.id,
      stock: 1,
    );
    response.fold((failure) {
      _mainController.setDropiDialogError(true, failure);

      update(['view']);
    }, (_) async {});
  }
}
