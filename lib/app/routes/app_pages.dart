import 'package:flutter/foundation.dart';

import 'package:get/get.dart';

import '../modules/admin/copy_cities/bindings/copy_cities_binding.dart';
import '../modules/admin/copy_cities/views/copy_cities_view.dart';
import '../modules/admin/copy_departments/bindings/copy_departments_binding.dart';
import '../modules/admin/copy_departments/views/copy_departments_view.dart';
import '../modules/admin/permissions/bindings/permissions_binding.dart';
import '../modules/admin/permissions/views/permissions_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/splash/bindings/splash_binding.dart';
import '../modules/auth/splash/views/splash_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/product_variants/edit_product_variant_combination/bindings/edit_product_variant_combination_binding.dart';
import '../modules/product_variants/edit_product_variant_combination/views/edit_product_variant_combination_view.dart';
import '../modules/product_variants/product_add_variant/bindings/product_add_variant_binding.dart';
import '../modules/product_variants/product_add_variant/views/product_add_variant_view.dart';
import '../modules/product_variants/product_variant_combinations/bindings/product_variant_combinations_binding.dart';
import '../modules/product_variants/product_variant_combinations/views/product_variant_combinations_view.dart';
import '../modules/product_variants/product_variant_for_type/bindings/product_variant_for_type_binding.dart';
import '../modules/product_variants/product_variant_for_type/views/product_variant_for_type_view.dart';
import '../modules/product_variants/product_variants/bindings/product_variants_binding.dart';
import '../modules/product_variants/product_variants/views/product_variants_view.dart';
import '../modules/products/create_product/bindings/create_product_binding.dart';
import '../modules/products/create_product/views/create_product_view.dart';
import '../modules/products/product_add_image/bindings/product_add_image_binding.dart';
import '../modules/products/product_add_image/views/product_add_image_view.dart';
import '../modules/products/product_estrellas_1/bindings/product_estrellas_1_binding.dart';
import '../modules/products/product_estrellas_1/views/product_estrellas_1_view.dart';
import '../modules/products/product_estrellas_2/bindings/product_estrellas_2_binding.dart';
import '../modules/products/product_estrellas_2/views/product_estrellas_2_view.dart';
import '../modules/products/product_images/bindings/product_images_binding.dart';
import '../modules/products/product_images/views/product_images_view.dart';
import '../modules/products/products/bindings/products_binding.dart';
import '../modules/products/products/views/products_view.dart';
import '../modules/providers/create_provider/bindings/create_provider_binding.dart';
import '../modules/providers/create_provider/views/create_provider_view.dart';
import '../modules/providers/create_warehouse/bindings/create_warehouse_binding.dart';
import '../modules/providers/create_warehouse/views/create_warehouse_view.dart';
import '../modules/providers/providers_estrellas_1/bindings/providers_estrellas_1_binding.dart';
import '../modules/providers/providers_estrellas_1/views/providers_estrellas_1_view.dart';
import '../modules/providers/providers_list/bindings/providers_list_binding.dart';
import '../modules/providers/providers_list/views/providers_list_view.dart';
import '../modules/providers/providers_warehouses/bindings/providers_warehouses_binding.dart';
import '../modules/providers/providers_warehouses/views/providers_warehouses_view.dart';
import '../modules/selects/select_city/bindings/select_city_binding.dart';
import '../modules/selects/select_city/views/select_city_view.dart';
import '../modules/selects/select_department/bindings/select_department_binding.dart';
import '../modules/selects/select_department/views/select_department_view.dart';
import '../modules/selects/select_product/bindings/select_product_binding.dart';
import '../modules/selects/select_product/views/select_product_view.dart';
import '../modules/selects/select_provider/bindings/select_provider_binding.dart';
import '../modules/selects/select_provider/views/select_provider_view.dart';
import '../modules/selects/select_warehouse/bindings/select_warehouse_binding.dart';
import '../modules/selects/select_warehouse/views/select_warehouse_view.dart';
import '../modules/admin/set_permissions/bindings/set_permissions_binding.dart';
import '../modules/admin/set_permissions/views/set_permissions_view.dart';
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
    GetPage(
      name: _Paths.PROVIDERS_ESTRELLAS_1,
      page: () => const ProvidersEstrellas1View(),
      binding: ProvidersEstrellas1Binding(),
    ),
    GetPage(
      name: _Paths.PROVIDERS_WAREHOUSES,
      page: () => const ProvidersWarehousesView(),
      binding: ProvidersWarehousesBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PROVIDER,
      page: () => const CreateProviderView(),
      binding: CreateProviderBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_WAREHOUSE,
      page: () => const CreateWarehouseView(),
      binding: CreateWarehouseBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_DEPARTMENT,
      page: () => const SelectDepartmentView(),
      binding: SelectDepartmentBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_CITY,
      page: () => const SelectCityView(),
      binding: SelectCityBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_PROVIDER,
      page: () => const SelectProviderView(),
      binding: SelectProviderBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_WAREHOUSE,
      page: () => const SelectWarehouseView(),
      binding: SelectWarehouseBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_PRODUCT,
      page: () => const SelectProductView(),
      binding: SelectProductBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_VARIANT_FOR_TYPE,
      page: () => const ProductVariantForTypeView(),
      binding: ProductVariantForTypeBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_VARIANT_COMBINATIONS,
      page: () => const ProductVariantCombinationsView(),
      binding: ProductVariantCombinationsBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PRODUCT_VARIANT_COMBINATION,
      page: () => const EditProductVariantCombinationView(),
      binding: EditProductVariantCombinationBinding(),
    ),
    GetPage(
      name: _Paths.COPY_DEPARTMENTS,
      page: () => const CopyDepartmentsView(),
      binding: CopyDepartmentsBinding(),
    ),
    GetPage(
      name: _Paths.COPY_CITIES,
      page: () => const CopyCitiesView(),
      binding: CopyCitiesBinding(),
    ),
    GetPage(
      name: _Paths.PERMISSIONS,
      page: () => const PermissionsView(),
      binding: PermissionsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.SET_PERMISSIONS,
      page: () => const SetPermissionsView(),
      binding: SetPermissionsBinding(),
    ),
  ];
}
