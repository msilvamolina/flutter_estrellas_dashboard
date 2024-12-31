import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../components/widgets/loadingButton.dart';
import '../../../../themes/input_decoration.dart';
import '../../../../themes/styles/typography.dart';
import '../controllers/create_product_controller.dart';

class ProductMainTab extends StatelessWidget {
  const ProductMainTab({super.key});

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).colorScheme.primary;

    return GetBuilder<CreateProductController>(
      id: 'view',
      builder: (controller) {
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
                        controller.imagePath ?? 'assets/images/picture.png',
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
                              'Avatar Url',
                              style: TypographyStyle.bodyBlackLarge
                                  .copyWith(color: primary),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              controller.imagePath ?? '(Selecciona una foto)',
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
                      // Elimina el Padding alrededor del Expanded
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Bodega',
                              style: TypographyStyle.bodyBlackLarge
                                  .copyWith(color: primary),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              (controller.warehouseModel != null
                                      ? ('${controller.warehouseModel!.name}\n${controller.providerModel!.name!}')
                                      : null) ??
                                  '(Selecciona un proveedor)',
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
            // Obx(
            //   () => DropDown(
            //     error: controller.productsError,
            //     selectedValue: controller.productSelected,
            //     values: controller.listProducts
            //         .map(
            //           (ProductFirebaseModel value) => OptionDropDown(
            //             text: value.name,
            //             value: value.id,
            //           ),
            //         )
            //         .toList(),
            //     onChanged: controller.onProductSelected,
            //   ),
            // ),
            const SizedBox(height: 26),
          ],
        );
      },
    );
  }
}
