import 'package:estrellas_dashboard/app/modules/products/create_product/tabs/description_tab.dart';
import 'package:estrellas_dashboard/app/modules/products/create_product/tabs/main_tab.dart';
import 'package:estrellas_dashboard/app/modules/products/create_product/tabs/warranty_tab.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/appbars/appbar_title_with_back.dart';
import '../../../../components/widgets/loadingButton.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/input_decoration.dart';
import '../../../../themes/styles/typography.dart';
import '../controllers/create_product_controller.dart';

class CreateProductView extends GetView<CreateProductController> {
  const CreateProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: ReactiveFormBuilder(
          form: controller.buildForm,
          builder: (context, form, child) {
            return MainLayout(
              showMenu: false,
              currentRoute: Routes.CREATE_PROVIDER,
              appBarTitle: 'Crear producto',
              appBarWidget: const TabBar(
                tabs: [
                  Tab(text: 'Info'),
                  Tab(text: 'Descripción'),
                  Tab(text: 'Garantía'),
                ],
              ),
              child: TabBarView(
                children: [
                  ProductMainTab(),
                  ProductDescriptionTab(),
                  ProductWarrantyTab(),
                ],
              ),
            );
          }),
    );
  }
}
