import 'package:cached_network_image/cached_network_image.dart';
import 'package:estrellas_dashboard/app/data/models/provider/provider/provider_model.dart';
import 'package:estrellas_dashboard/app/routes/app_pages.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/product/product/product.dart';
import '../../../../data/models/provider/warehouse/provider_warehouse_model.dart';

class ProviderWarehouseCard extends StatelessWidget {
  const ProviderWarehouseCard({required this.provider, super.key});
  final ProviderModel provider;

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  provider.id,
                  style: TypographyStyle.bodyRegularSmall,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  width: 60,
                  imageUrl: (provider.avatarUrl ?? ''),
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        provider.name ?? '',
                        style: TypographyStyle.h4Mobile,
                      ),
                      // const SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (provider.warehouses != null)
              Wrap(
                children: [
                  for (ProviderWarehouseModel element in provider.warehouses!)
                    wareHouseCard(element, provider),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget wareHouseCard(ProviderWarehouseModel element, ProviderModel provider) {
    return Card(
      color: Colors.black.withOpacity(0.1),
      child: InkWell(
        onTap: () {
          Get.back(result: [element, provider]);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.asset(
                'assets/images/warehouse.png',
                width: 60,
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    element.name ?? '',
                    style: TypographyStyle.bodyBlackMedium
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    element.id,
                    style: TypographyStyle.bodyRegularSmall,
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
