import 'dart:convert';

import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:estrellas_dashboard/app/data/providers/local/local_storage.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/quill_delta.dart';

import 'package:get/get.dart';

import '../../../app/controllers/main_controller.dart';
import '../../../data/models/product/product_firebase/product_firebase_model.dart';
import '../../../data/models/product/product_firebase_lite/product_firebase_lite.dart';
import '../../../data/models/product_image/product_image_model.dart';
import '../../../data/models/product_variant/product_variant_model.dart';
import '../../../data/models/product_variant_combination/product_variant_combination_model.dart';
import '../../../data/models/videos/video_post_model.dart';
import '../../../data/providers/repositories/products/products_repository.dart';
import '../../../routes/app_pages.dart';

class ProductDetailsController extends GetxController {
  MainController mainController = Get.find<MainController>();
  final ProductsRepository _repository = ProductsRepository();

  LocalStorage localStorage = Get.find<LocalStorage>();

  late VideoPostModel videoPostModel;
  late ProductFirebaseModel product;

  final RxList<ProductImageModel> _listImages = <ProductImageModel>[].obs;
  List<ProductImageModel> get listImages => _listImages.toList();

  final RxList<ProductVariantCombinationModel> _listCombination =
      <ProductVariantCombinationModel>[].obs;
  List<ProductVariantCombinationModel> get listCombination =>
      _listCombination.toList();
  List<String> _newOrderList = [];
  final RxList<ProductVariantModel> sizeList = <ProductVariantModel>[].obs;
  final RxList<ProductVariantModel> colorList = <ProductVariantModel>[].obs;

  final RxList<ProductVariantModel> _listVariants = <ProductVariantModel>[].obs;
  List<ProductVariantModel> get listVariants => _listVariants.toList();

  ProductVariantModel? _userProductVariantColor;
  ProductVariantModel? get userProductVariantColor => _userProductVariantColor;

  ProductVariantModel? _userProductVariantSize;
  ProductVariantModel? get userProductVariantSize => _userProductVariantSize;

  ProductVariantCombinationModel? _productVariantCombination;

  bool _isInCart = true;
  bool get isInCart => _isInCart;

  double _price = 0;
  double get price => _price;

  double _suggestedPrice = 0;
  double get suggestedPrice => _suggestedPrice;

  int _stock = 0;
  int get stock => _stock;

  int _quantity = 1;
  int get quantity => _quantity;

  int _points = 0;
  int get points => _points;

  final QuillController descriptionController = QuillController(
    document: Document(),
    readOnly: true,
    selection: const TextSelection.collapsed(offset: 0),
  );
  final FocusNode descriptionEditorFocusNode = FocusNode();
  final ScrollController descriptionEditorScrollController = ScrollController();

  final QuillController detailsController = QuillController(
    document: Document(),
    readOnly: true,
    selection: const TextSelection.collapsed(offset: 0),
  );
  final FocusNode detailsEditorFocusNode = FocusNode();
  final ScrollController detailsEditorScrollController = ScrollController();

  final QuillController warrantyController = QuillController(
    document: Document(),
    readOnly: true,
    selection: const TextSelection.collapsed(offset: 0),
  );
  final FocusNode warrantyEditorFocusNode = FocusNode();
  final ScrollController warrantyEditorScrollController = ScrollController();

  @override
  void onInit() {
    product = Get.arguments as ProductFirebaseModel;
    _listImages.bindStream(_repository.getProductImages(productId: product.id));
    _listVariants.bindStream(_repository.getAllProductVariants(
      productId: product.id,
    ));
    _listCombination.bindStream(_repository.getAllProductVariantsCombinations(
      productId: product.id,
    ));

    if (product.descriptionFormatted != null) {
      final descriptionDelta =
          Delta.fromJson(jsonDecode(product.descriptionFormatted));
      descriptionController.document = Document.fromDelta(descriptionDelta);
    }

    if (product.detailsFormatted != null) {
      final detailsDelta = Delta.fromJson(jsonDecode(product.detailsFormatted));
      detailsController.document = Document.fromDelta(detailsDelta);
    }

    if (product.warrantyFormatted != null) {
      final warrantyDelta =
          Delta.fromJson(jsonDecode(product.warrantyFormatted));
      warrantyController.document = Document.fromDelta(warrantyDelta);
    }

    resetPrice();
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    openGuideTour();
  }

  String guideTourName = 'feature_product_detail_button';

  Future<void> openGuideTour() async {
    bool userWantToSee = await localStorage.getGuideTourStatus(guideTourName);

    if (userWantToSee) {
      await FeatureDiscovery.clearPreferences(Get.context!, [
        guideTourName,
      ]);
      FeatureDiscovery.discoverFeatures(
        Get.context!,
        [guideTourName],
      );
    }
  }

  Future<void> guideTourNotShowAgain() async {
    await localStorage.setGuideTourStatus(guideTourName, false);
    FeatureDiscovery.completeCurrentStep(Get.context!);
  }

  void resetPrice() {
    _price = product.price ?? 0;
    _suggestedPrice = product.suggestedPrice ?? 0;
    _points = product.points ?? 0;
    _stock = product.stock ?? 1;
    _quantity = 1;
    update(['product_price', 'content_product', 'product_quantity']);
  }

  Future<void> addToCart() async {}

  Future<void> removeFromCart() async {}

  void addQuantity() {
    int _newQuantity = _quantity + 1;
    _quantity = _newQuantity > _stock ? _stock : _newQuantity;
    update(['product_quantity']);
  }

  void minusQuantity() {
    int _newQuantity = _quantity - 1;
    _quantity = _newQuantity < 1 ? 1 : _newQuantity;
    update(['product_quantity']);
  }

  ProductVariantCombinationModel? getBySizeAndColor(
      String? sizeId, String? colorId) {
    ProductVariantCombinationModel? option = _listCombination.firstWhereOrNull(
        (element) => element.sizeId == sizeId && element.colorId == colorId);

    return option;
  }

  void buildVariationPrice() {
    _productVariantCombination = getBySizeAndColor(
        _userProductVariantSize?.id, _userProductVariantColor?.id);

    if (_productVariantCombination != null) {
      _price = _productVariantCombination!.price ?? 0;
      _suggestedPrice = _productVariantCombination!.suggestedPrice ?? 0;
      _points = _productVariantCombination!.points ?? 0;
      _stock = _productVariantCombination!.stock ?? 1;
      _quantity = 1;
      update(['product_price', 'content_product', 'product_quantity']);
    } else {
      resetPrice();
    }
  }

  void setFirstProductVariationCombination() {
    _productVariantCombination = getBySizeAndColor(
        _userProductVariantSize?.id, _userProductVariantColor?.id);
  }

  void setFirstVariantColor(ProductVariantModel value) {
    if (_userProductVariantColor == null) {
      _userProductVariantColor = value;
      setFirstProductVariationCombination();

      update(['product_variant_color']);
    }
  }

  void chooseColorVariant(ProductVariantModel value) {
    _userProductVariantColor = value;
    update(['product_variant_color']);
    buildVariationPrice();
  }

  void setFirstVariantSize(ProductVariantModel value) {
    if (_userProductVariantSize == null) {
      _userProductVariantSize = value;
      setFirstProductVariationCombination();

      update(['product_variant_size']);
    }
  }

  void chooseSizeVariant(ProductVariantModel value) {
    _userProductVariantSize = value;
    Get.back();
    update(['product_variant_size']);
    buildVariationPrice();
  }

  void openPhotoView() {
    MultiImageProvider multiImageProvider = MultiImageProvider([
      NetworkImage(product.thumbnail ?? ''),
      if (_listImages.isNotEmpty)
        for (ProductImageModel image in _listImages)
          NetworkImage(image.imageUrl),
    ]);

    showImageViewerPager(Get.context!, multiImageProvider,
        onPageChanged: (page) {
      // print("page changed to $page");
    }, onViewerDismissed: (page) {
      // print("dismissed while on page $page");
    });
  }

  Future<void> moreOptions() async {
    await showDialog<String>(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Editar'),
                onTap: () {
                  Get.back();
                  Get.toNamed(
                    Routes.CREATE_PRODUCT,
                    arguments: product,
                  );
                },
              ),
              Divider(),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('Ver información'),
                onTap: () {
                  Get.back();
                  Get.toNamed(
                    Routes.PRODUCT_INFO,
                    arguments: product,
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.image_rounded),
                title: const Text('Imágenes'),
                onTap: () {
                  Get.back();
                  Get.toNamed(
                    Routes.PRODUCT_IMAGES,
                    arguments: product,
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.layers),
                title: const Text('Variaciones'),
                onTap: () {
                  Get.back();
                  Get.toNamed(
                    Routes.NEW_VARIATIONS,
                    arguments: product,
                  );
                },
              ),
              Divider(),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Eliminar'),
                onTap: () {
                  Get.back();
                  deleteProduct();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> deleteProduct() async {
    final result = await showDialog<bool>(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmación'),
          content:
              const Text('¿Estás seguro de que deseas eliminar este producto?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Cancelar
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Confirmar
              },
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );

    if (result == true) {}
  }
}
