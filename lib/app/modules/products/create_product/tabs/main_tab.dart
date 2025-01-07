import 'package:estrellas_dashboard/app/modules/products/create_product/components/categories_tags.dart';
import 'package:estrellas_dashboard/app/themes/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../themes/input_decoration.dart';
import '../../../../themes/styles/typography.dart';
import '../controllers/create_product_controller.dart';

class ProductMainTab extends StatelessWidget {
  const ProductMainTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateProductController>(
      id: 'view',
      builder: (controller) {
        return SingleChildScrollView(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!controller.editMode.value ||
                    controller.imageIsEditted.value)
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
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Avatar Url',
                                    style:
                                        TypographyStyle.bodyBlackLarge.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
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
                              color: Theme.of(context).colorScheme.primary,
                              size: 48,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                else
                  Card(
                    child: InkWell(
                      onTap: controller.pickImage,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              controller.product?.thumbnail ?? '',
                              width: 80,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Avatar Url',
                                    style:
                                        TypographyStyle.bodyBlackLarge.copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    controller.product?.thumbnail ?? '',
                                    style: TypographyStyle.bodyRegularSmall,
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Theme.of(context).colorScheme.primary,
                              size: 48,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                const SizedBox(height: 16),

                // Selección de bodega
                Card(
                  child: InkWell(
                    onTap: controller.pickWarehouse,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/warehouse.png',
                            width: 80,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Bodega',
                                  style:
                                      TypographyStyle.bodyBlackLarge.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  controller.warehouseName != null
                                      ? ('${controller.warehouseName}\n${controller.providerName}')
                                      : '(Selecciona un proveedor)',
                                  style: TypographyStyle.bodyRegularSmall,
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            color: Theme.of(context).colorScheme.primary,
                            size: 48,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Campos de texto
                ReactiveTextField(
                  formControlName: Fields.name.name,
                  keyboardType: TextInputType.text,
                  decoration: CustomInputDecoration.inputDecoration(
                    text: "Name",
                  ),
                ),
                const SizedBox(height: 16),

                ReactiveTextField(
                  formControlName: Fields.price.name,
                  keyboardType: TextInputType.number,
                  decoration: CustomInputDecoration.inputDecoration(
                    text: "Price",
                  ),
                ),
                const SizedBox(height: 16),

                ReactiveTextField(
                  formControlName: Fields.suggestedPrice.name,
                  keyboardType: TextInputType.number,
                  decoration: CustomInputDecoration.inputDecoration(
                    text: "Suggested Price",
                  ),
                ),
                const SizedBox(height: 16),

                ReactiveTextField(
                  formControlName: Fields.points.name,
                  keyboardType: TextInputType.number,
                  decoration: CustomInputDecoration.inputDecoration(
                    text: "Points",
                  ),
                ),
                const SizedBox(height: 16),

                ReactiveTextField(
                  formControlName: Fields.stock.name,
                  keyboardType: TextInputType.number,
                  decoration: CustomInputDecoration.inputDecoration(
                    text: "Stock",
                  ),
                ),
                const SizedBox(height: 36),

                // Sección de Categorías
                Text(
                  'Categorías:',
                  style: TypographyStyle.bodyBlackLarge
                      .copyWith(color: secondaryBase),
                ),
                const SizedBox(height: 16),

                // Componente de selección múltiple
                const CategoriesTags(),

                const SizedBox(height: 46),
              ],
            ),
          ),
        );
      },
    );
  }
}
