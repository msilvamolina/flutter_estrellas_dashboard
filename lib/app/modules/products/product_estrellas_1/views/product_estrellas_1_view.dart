import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:estrellas_dashboard/app/utils/responsive.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/product_estrellas_1_controller.dart';

class ProductEstrellas1View extends GetView<ProductEstrellas1Controller> {
  const ProductEstrellas1View({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        maxWidth: double.infinity,
        currentRoute: Routes.PRODUCT_ESTRELLAS_1,
        appBarWidget: Row(
          crossAxisAlignment: !Responsive.isTablet2(context)
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (Responsive.isTablet2(context)) ...[
              IconButton(
                onPressed: Get.back,
                icon: const Icon(
                  Icons.chevron_left,
                  size: 34,
                ),
              ),
              const Spacer(),
            ],
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: !Responsive.isTablet2(context) ? 8 : 0),
                child: Text(
                  controller.product.name,
                  style: TypographyStyle.h3Mobile,
                ),
              ),
            ),
            if (Responsive.isTablet2(context)) ...[
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_rounded,
                  size: 34,
                ),
              ),
            ],
          ],
        ),
        child: Center(
          child: Text(controller.product.name),
        ));
  }
}
