import 'package:estrellas_dashboard/app/modules/product_variants/product_variant_for_type/controllers/product_variant_for_type_controller.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/appbars/appbar_title_with_back.dart';
import '../../../../components/widgets/loadingButton.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/input_decoration.dart';
import '../controllers/product_add_variant_controller.dart';

class ProductAddVariantView extends GetView<ProductAddVariantController> {
  const ProductAddVariantView({super.key});

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).colorScheme.primary;

    return ReactiveFormBuilder(
        form: controller.buildForm,
        builder: (context, form, child) {
          return MainLayout(
            showMenu: false,
            currentRoute: Routes.PRODUCT_ADD_VARIANT,
            appBarTitle: 'Añadir imagen',
            appBarWidget: AppbarTitleWithBack(
                title: 'Nuevo ${controller.typeSelected.name}'),
            child: GetBuilder<ProductAddVariantController>(
              id: 'view',
              builder: (_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: InkWell(
                        onTap: controller.pickImage,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                controller.imagePath ??
                                    'assets/images/picture.png',
                                width: 80,
                              ),
                              const SizedBox(width: 12),
                              // Elimina el Padding alrededor del Expanded
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Image Url',
                                      style: TypographyStyle.bodyBlackLarge
                                          .copyWith(color: primary),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      controller.imagePath ??
                                          '(Selecciona una foto)',
                                      style: TypographyStyle.bodyRegularSmall,
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                color: primary,
                                size: 48,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ReactiveTextField(
                      formControlName: Fields.name.name,
                      keyboardType: TextInputType.text,
                      decoration: CustomInputDecoration.inputDecoration(
                        text: "Nombre",
                      ),
                    ),
                    const SizedBox(height: 16),
                    ReactiveTextField(
                      formControlName: Fields.label.name,
                      keyboardType: TextInputType.text,
                      decoration: CustomInputDecoration.inputDecoration(
                        text: "Label",
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                        "El valor de label se utiliza para mostrarle al usuario, por ejemplo: L"),
                    const SizedBox(height: 16),
                    if (controller.typeSelected == VariantsTypes.color) ...[
                      Text(
                        'Color label:',
                        style: TypographyStyle.bodyBlackLarge,
                      ),
                      const SizedBox(height: 16),
                      MaterialColorPicker(
                        selectedColor: controller.selectedColor,
                        onColorChange: controller.onColorChange,
                      ),
                      const SizedBox(height: 26),
                    ],
                    ReactiveFormConsumer(
                      builder: (context, form, child) => LoadingButton(
                        label: 'Guardar',
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
