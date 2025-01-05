import 'package:cached_network_image/cached_network_image.dart';
import 'package:estrellas_dashboard/app/modules/products/products/widgets/product_firebase_card.dart';
import 'package:estrellas_dashboard/app/routes/app_pages.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:estrellas_dashboard/app/utils/money_amount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../../data/models/product/product_firebase/product_firebase_model.dart';
import '../controllers/products_controller.dart';
import '../widgets/product_card.dart';

class TabEstrellas2 extends StatelessWidget {
  const TabEstrellas2({required this.controller, super.key});

  final ProductsController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.list.isNotEmpty
          ? MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              itemCount: controller.list.length,
              itemBuilder: (context, index) {
                return _listItem(
                  context: context,
                  product: controller.list[index],
                  index: index,
                  resetSlide: false,
                );
              },
            )
          : const Text('no data'),
    );
  }
}

Widget _listItem({
  required BuildContext context,
  required ProductFirebaseModel product,
  required int index,
  required bool resetSlide,
}) {
  return Card(
    child: InkWell(
      onTap: () {
        Get.toNamed(Routes.PRODUCTS_DETAILS, arguments: product);
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CachedNetworkImage(
              width: 90,
              imageUrl: (product.thumbnail ?? ''),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Image.asset(
                'assets/images/new-product.png',
                width: 80,
              ),
            ),
            SizedBox(height: 12),
            Text(
              product.name ?? '',
              style: TypographyStyle.bodyBlackLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              MoneyAmount.convertMoneyString(product.price ?? 0),
              style: TypographyStyle.bodyBlackLarge,
              textAlign: TextAlign.start,
            )
          ],
        ),
      ),
    ),
  );
}
