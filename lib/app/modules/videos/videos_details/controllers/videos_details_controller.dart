import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/app/controllers/main_controller.dart';
import 'package:estrellas_dashboard/app/data/models/videos/video_post_model.dart';
import 'package:estrellas_dashboard/app/data/providers/repositories/products/products_repository.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/models/product/product_firebase/product_firebase_model.dart';
import '../../../../data/providers/local/local_storage.dart';
import '../../../../data/providers/repositories/videos/videos_repository.dart';

class VideosDetailsController extends GetxController {
  late VideoPostModel videoPostModel;
  final VideosRepository _repository = VideosRepository();
  final ProductsRepository _productsRepository = ProductsRepository();
  final MainController _mainController = Get.find<MainController>();
  LocalStorage localStorage = Get.find<LocalStorage>();

  @override
  void onInit() {
    videoPostModel = Get.arguments as VideoPostModel;
    super.onInit();
  }

  @override
  void onReady() {
    openGuideTour();
  }

  String guideTourName = 'feature_video_details';
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
                title: const Text('Actualizar producto'),
                onTap: () {
                  Get.back();
                  updateProductInfoDialog();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> updateProductInfoDialog() async {
    final result = await showDialog<bool>(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
              '¿Estás seguro de que quieres actualizar el producto de este video?'),
          content: const Text(
              'Estos cambios no se pueden deshacer y con esta acción modificarás el precio, stock, puntos y variaciones del producto vinculado al video'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Confirmar
              },
              child: const Text('Continuar'),
            ),
          ],
        );
      },
    );

    if (result == true) {
      if (videoPostModel.productId != null) {
        updateProductInfo();
      }
    }
  }

  Future<void> updateProductInfo() async {
    _mainController.setDropiDialog(false);
    _mainController.showDropiLoader();
    _mainController.setDropiMessage('Obteniendo información del producto');

    ProductFirebaseModel? newProduct = await _productsRepository
        .getProductFromFirebaseById(videoPostModel.productId!);

    if (newProduct != null) {
      _mainController.setDropiMessage('Guardando nueva información');

      Either<String, dynamic> response = await _repository.updateProductInVideo(
          videoId: videoPostModel.id, product: newProduct);
      response.fold((failure) {
        _mainController.setDropiDialogError(true, failure);
      }, (imagesMap) async {
        _mainController.setDropiMessage('Success!');
        Get.back();
      });
    } else {
      _mainController.setDropiDialogError(
          true, 'No se pudo obtener la información del producto');
    }
  }
}
