import 'package:flutter/material.dart';

import '../../../data/models/variant_attributte/variant_attributte.dart';
import '../../../data/models/variant_variant/variant_variant.dart';
import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';
import '../../new_variations_custom_pickers/widgets/variant_card.dart';
import '../controllers/product_details_controller.dart';
import 'content/product_card_container.dart';
import 'product_variant_card.dart';

class ProductNewVariants extends StatelessWidget {
  const ProductNewVariants({required this.controller, super.key});

  final ProductDetailsController controller;
  @override
  Widget build(BuildContext context) {
    if (controller.variantInfoModel != null) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (int index = 0;
                index < controller.variantInfoModel!.attributes!.length;
                index++)
              Padding(
                padding: EdgeInsets.only(
                  bottom:
                      (controller.variantInfoModel!.attributes!.length - 1) <
                              index
                          ? 0
                          : 16,
                ),
                child: ProductCardContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        controller.variantInfoModel!.attributes![index].name,
                        style: TypographyStyle.bodyRegularLarge
                            .copyWith(color: neutral700),
                      ),
                      SizedBox(height: 8),
                      Wrap(
                        children: [
                          for (int index2 = 0;
                              index2 <
                                  controller
                                      .getVariations(controller
                                          .variantInfoModel!.attributes![index])
                                      .length;
                              index2++)
                            GestureDetector(
                              onTap: () => controller.onCardPressed(
                                  controller.getVariations(controller
                                      .variantInfoModel!
                                      .attributes![index])[index2]),
                              child: ProductVariantCard(
                                  variant: controller.getVariations(controller
                                      .variantInfoModel!
                                      .attributes![index])[index2]),
                            )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      );
      return ListView.separated(
        itemCount: controller.variantInfoModel!.attributes!.length,
        itemBuilder: (context, index) {
          List<VariantVariantModel> list = controller
              .getVariations(controller.variantInfoModel!.attributes![index]);
          return Padding(
            padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.variantInfoModel!.attributes![index].name,
                      style: TypographyStyle.bodyBlackLarge,
                    ),
                    SizedBox(height: 8),
                    Wrap(
                      children: [
                        for (int index2 = 0; index2 < list.length; index2++)
                          GestureDetector(
                            onTap: () => controller.onCardPressed(list[index2]),
                            child: Card(
                              color: Colors.amber,
                              child: VariantCard(variant: list[index2]),
                            ),
                          )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox.shrink(),
      );
    }

    return SizedBox.shrink();
  }
}
