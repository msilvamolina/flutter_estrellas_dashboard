import 'package:estrellas_dashboard/app/modules/products/create_product/tabs/description_tab.dart';
import 'package:estrellas_dashboard/app/modules/products/create_product/tabs/main_tab.dart';
import 'package:estrellas_dashboard/app/modules/products/create_product/tabs/warranty_tab.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/appbars/appbar_title_with_back.dart';
import '../../../../components/buttons/buttons.dart';
import '../../../../components/widgets/loadingButton.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/input_decoration.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../../../../themes/themes/default_light_theme.dart';
import '../controllers/create_product_controller.dart';
import '../tabs/details_tab.dart';

class CreateProductView extends GetView<CreateProductController> {
  const CreateProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: defaultLightTheme,
      child: DefaultTabController(
        length: 4,
        child: ReactiveFormBuilder(
            form: controller.buildForm,
            builder: (context, form, child) {
              return MainLayout(
                showMenu: false,
                currentRoute: Routes.CREATE_PRODUCT,
                appBarTitle: 'Crear producto',
                bottomNavigationBar: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ReactiveFormConsumer(
                      builder: (context, form, child) => Button(
                        style: ButtonStyles.primary,
                        onPressed: (form.valid)
                            ? () => controller.sendForm(form.value)
                            : null,
                        label: 'Crear',
                      ),
                    ),
                  ),
                ),
                appBarWidget: TabBar(
                  labelStyle: TypographyStyle.bodyBlackMedium,
                  indicatorColor: primaryBase,
                  labelColor: secondaryBase,
                  unselectedLabelColor: neutral700,
                  dividerColor: neutral400,
                  tabs: [
                    Tab(text: 'Info'),
                    Tab(text: 'Descripción'),
                    Tab(text: 'Detalles'),
                    Tab(text: 'Garantía'),
                  ],
                ),
                child: TabBarView(
                  children: [
                    ProductMainTab(),
                    ProductDescriptionTab(),
                    ProductDetailsTab(),
                    ProductWarrantyTab(),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
