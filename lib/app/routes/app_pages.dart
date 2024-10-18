import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/splash/bindings/splash_binding.dart';
import '../modules/auth/splash/views/splash_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/products/create_product/bindings/create_product_binding.dart';
import '../modules/products/create_product/views/create_product_view.dart';
import '../modules/products/product_add_image/bindings/product_add_image_binding.dart';
import '../modules/products/product_add_image/views/product_add_image_view.dart';
import '../modules/products/product_add_variant/bindings/product_add_variant_binding.dart';
import '../modules/products/product_add_variant/views/product_add_variant_view.dart';
import '../modules/products/product_estrellas_1/bindings/product_estrellas_1_binding.dart';
import '../modules/products/product_estrellas_1/views/product_estrellas_1_view.dart';
import '../modules/products/product_estrellas_2/bindings/product_estrellas_2_binding.dart';
import '../modules/products/product_estrellas_2/views/product_estrellas_2_view.dart';
import '../modules/products/product_images/bindings/product_images_binding.dart';
import '../modules/products/product_images/views/product_images_view.dart';
import '../modules/products/product_variants/bindings/product_variants_binding.dart';
import '../modules/products/product_variants/views/product_variants_view.dart';
import '../modules/products/products/bindings/products_binding.dart';
import '../modules/products/products/views/products_view.dart';
import '../modules/providers/providers_list/bindings/providers_list_binding.dart';
import '../modules/providers/providers_list/views/providers_list_view.dart';
import '../modules/test_endpoints/test_get_products/bindings/test_get_products_binding.dart';
import '../modules/test_endpoints/test_get_products/views/test_get_products_view.dart';
import '../modules/test_endpoints/test_login_app_dropi/bindings/test_login_app_dropi_binding.dart';
import '../modules/test_endpoints/test_login_app_dropi/views/test_login_app_dropi_view.dart';
import '../modules/videos/create_video/bindings/create_video_binding.dart';
import '../modules/videos/create_video/views/create_video_view.dart';
import '../modules/videos/videos_details/bindings/videos_details_binding.dart';
import '../modules/videos/videos_details/views/videos_details_view.dart';
import '../modules/videos/videos_list/bindings/videos_list_binding.dart';
import '../modules/videos/videos_list/views/videos_list_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = kIsWeb ? Routes.HOME : Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.PRODUCTS,
      page: () => const ProductsView(),
      binding: ProductsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.TEST_GET_PRODUCTS,
      page: () => const TestGetProductsView(),
      binding: TestGetProductsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.TEST_LOGIN_APP_DROPI,
      page: () => const TestLoginAppDropiView(),
      binding: TestLoginAppDropiBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.PRODUCT_ESTRELLAS_1,
      page: () => const ProductEstrellas1View(),
      binding: ProductEstrellas1Binding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.VIDEOS_LIST,
      page: () => const VideosListView(),
      binding: VideosListBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.CREATE_VIDEO,
      page: () => CreateVideoView(),
      binding: CreateVideoBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.VIDEOS_DETAILS,
      page: () => const VideosDetailsView(),
      binding: VideosDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_ESTRELLAS_2,
      page: () => const ProductEstrellas2View(),
      binding: ProductEstrellas2Binding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_IMAGES,
      page: () => const ProductImagesView(),
      binding: ProductImagesBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_ADD_IMAGE,
      page: () => const ProductAddImageView(),
      binding: ProductAddImageBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_VARIANTS,
      page: () => const ProductVariantsView(),
      binding: ProductVariantsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_ADD_VARIANT,
      page: () => const ProductAddVariantView(),
      binding: ProductAddVariantBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PRODUCT,
      page: () => const CreateProductView(),
      binding: CreateProductBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDERS_LIST,
      page: () => const ProvidersListView(),
      binding: ProvidersListBinding(),
    ),
  ];
}
