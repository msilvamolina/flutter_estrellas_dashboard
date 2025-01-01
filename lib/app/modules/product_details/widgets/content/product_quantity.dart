import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../components/fields/quantity.dart';
import '../../../../data/models/product_variant/product_variant_model.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../../controllers/product_details_controller.dart';
import 'product_card_container.dart';

class ProductQuantity extends StatelessWidget {
  const ProductQuantity({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
        id: 'product_quantity',
        builder: (controller) {
          return ProductCardContainer(
            child: Row(
              children: [
                Text(
                  'Cantidad',
                  style: TypographyStyle.bodyRegularLarge
                      .copyWith(color: neutral700),
                ),
                Spacer(),
                FieldQuantity(
                  value: controller.quantity,
                  addFunction: controller.addQuantity,
                  minusFunction: controller.minusQuantity,
                  maxValue: controller.stock,
                ),
              ],
            ),
          );
        });
  }
}
