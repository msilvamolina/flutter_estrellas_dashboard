import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../components/buttons/button_circle_svg.dart';
import '../../../../libraries/icons/icons_font.dart';
import '../../../../themes/styles/colors.dart';
import '../../../../themes/styles/typography.dart';
import '../../controllers/product_details_controller.dart';
import 'product_card_container.dart';

class ProductContentProduct extends StatelessWidget {
  const ProductContentProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      id: 'content_product',
      builder: (controller) {
        bool providerNeedExpanded =
            (controller.product.providerName?.length ?? 0) > 20;

        return ProductCardContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.product.name ?? '',
                style: TypographyStyle.bodyBlackLarge.copyWith(
                  color: neutral900,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  providerNeedExpanded
                      ? Expanded(
                          child: Text(
                            controller.product.providerName ?? 'ESTRELLAS',
                            style: TypographyStyle.bodyRegularMedium.copyWith(
                              color: neutral700,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        )
                      : Text(
                          controller.product.providerName ?? 'ESTRELLAS',
                          style: TypographyStyle.bodyRegularMedium.copyWith(
                            color: neutral700,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                  SizedBox(width: 6),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: CircleAvatar(
                      backgroundColor: neutral500,
                      radius: 1.5,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    EstrellasIcons.starFill,
                    color: tertiaryBase,
                    size: 22,
                  ),
                  Text(
                    '4.8',
                    style: TypographyStyle.bodyRegularMedium.copyWith(
                      color: neutral700,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'comentarios',
                    style: TypographyStyle.bodyRegularMedium.copyWith(
                      color: neutral700,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    '¡Quedan ${controller.stock}!',
                    style: TypographyStyle.bodyBlackMedium.copyWith(
                      color: secondaryBase,
                    ),
                  ),
                  Spacer(),
                  ButtonCircleSvg(
                    assetName: 'assets/svg/Heart.svg',
                    color: neutral700,
                    onTap: () {},
                    width: 28,
                  ),
                  ButtonCircleSvg(
                    assetName: 'assets/svg/Comment.svg',
                    color: neutral700,
                    onTap: () {},
                    width: 22,
                  ),
                  ButtonCircleSvg(
                    assetName: 'assets/svg/Cart.svg',
                    color: neutral700,
                    onTap: () {},
                    width: 26,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
