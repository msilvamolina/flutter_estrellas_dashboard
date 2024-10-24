import 'package:cached_network_image/cached_network_image.dart';
import 'package:estrellas_dashboard/app/data/models/provider/provider/provider_model.dart';
import 'package:estrellas_dashboard/app/routes/app_pages.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/product/product/product.dart';

class ProviderCard extends StatelessWidget {
  const ProviderCard({required this.provider, this.functionIsDone, super.key});
  final ProviderModel provider;

  final Function()? functionIsDone;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.PROVIDERS_ESTRELLAS_1, arguments: provider);
          if (functionIsDone != null) {
            functionIsDone!();
          }
        },
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
                    width: 90,
                    imageUrl:
                        'https://storage.googleapis.com/dev_bucket_estrellas/' +
                            (provider.avatarUrl ?? ''),
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
                          provider.name ?? '',
                          style: TypographyStyle.h4Mobile,
                        ),
                        // const SizedBox(height: 8),
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
