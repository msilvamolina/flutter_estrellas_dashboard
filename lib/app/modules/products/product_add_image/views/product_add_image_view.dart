import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/appbars/appbar_title_with_back.dart';
import '../../../../components/widgets/loadingButton.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/input_decoration.dart';
import '../controllers/product_add_image_controller.dart';

class ProductAddImageView extends GetView<ProductAddImageController> {
  const ProductAddImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
        form: controller.buildForm,
        builder: (context, form, child) {
          return MainLayout(
            showMenu: false,
            currentRoute: Routes.PRODUCT_ADD_IMAGE,
            appBarTitle: 'Añadir imagen',
            appBarWidget: AppbarTitleWithBack(title: controller.product.name),
            child: GetBuilder<ProductAddImageController>(
              id: 'view',
              builder: (_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReactiveTextField(
                      formControlName: Fields.imageName.name,
                      keyboardType: TextInputType.text,
                      decoration: CustomInputDecoration.inputDecoration(
                        text: "Nombre",
                      ),
                    ),
                    const SizedBox(height: 26),
                    ReactiveFormConsumer(
                      builder: (context, form, child) => LoadingButton(
                        label: 'Subir imagen',
                        isLoading: controller.loading,
                        onPressed: (form.valid)
                            ? () => controller.sendForm(form.value)
                            : null,
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        });
  }
}
