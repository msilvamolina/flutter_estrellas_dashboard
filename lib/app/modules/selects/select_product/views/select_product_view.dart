import 'package:cached_network_image/cached_network_image.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../../../../data/models/product/product_firebase/product_firebase_model.dart';
import '../controllers/select_product_controller.dart';

class SelectProductView extends GetView<SelectProductController> {
  const SelectProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elegí un producto'),
        centerTitle: true,
      ),
      body: Obx(
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
      ),
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
        Get.back(result: product);
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
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
            SizedBox(height: 8),
            Text(
              product.name ?? '',
              style: TypographyStyle.bodyBlackLarge,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    ),
  );
}
