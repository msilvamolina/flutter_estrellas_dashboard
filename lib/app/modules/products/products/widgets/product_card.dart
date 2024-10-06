import 'package:cached_network_image/cached_network_image.dart';
import 'package:estrellas_dashboard/app/routes/app_pages.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/product/product/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, super.key});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () =>
            Get.toNamed(Routes.PRODUCT_ESTRELLAS_1, arguments: product),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ID: ',
                    style: TypographyStyle.bodyBlackSmall
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    product.id,
                    style: TypographyStyle.bodyRegularSmall,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    width: 90,
                    imageUrl: product.thumbnail,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TypographyStyle.h4Mobile,
                        ),
                        // const SizedBox(height: 8),
                        Text(
                          product.category.name,
                          style: TypographyStyle.bodyRegularSmall,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          product.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TypographyStyle.bodyBlackMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
