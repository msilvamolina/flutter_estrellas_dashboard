import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/provider/warehouse/provider_warehouse_model.dart';
import '../../../../themes/styles/typography.dart';

class WarehouseCard extends StatelessWidget {
  const WarehouseCard({required this.warehouse, super.key});
  final ProviderWarehouseModel warehouse;

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).colorScheme.primary;

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
                  warehouse.id,
                  style: TypographyStyle.bodyRegularSmall,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  warehouse.name ?? '',
                  style: TypographyStyle.h4Mobile,
                ),
                const SizedBox(height: 8),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: '',
                    children: <TextSpan>[
                      TextSpan(
                        text: 'External ID: ',
                        style: TypographyStyle.bodyBlackMedium
                            .copyWith(color: primary),
                      ),
                      TextSpan(
                          text: warehouse.externalID ?? '',
                          style: TypographyStyle.bodyRegularMedium),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: '',
                    children: <TextSpan>[
                      TextSpan(
                        text: 'phone: ',
                        style: TypographyStyle.bodyBlackMedium
                            .copyWith(color: primary),
                      ),
                      TextSpan(
                          text: warehouse.phone ?? '',
                          style: TypographyStyle.bodyRegularMedium),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: '',
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Address: ',
                        style: TypographyStyle.bodyBlackMedium
                            .copyWith(color: primary),
                      ),
                      TextSpan(
                          text: warehouse.address ?? '',
                          style: TypographyStyle.bodyRegularMedium),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: '',
                    children: <TextSpan>[
                      TextSpan(
                        text: 'City ID: ',
                        style: TypographyStyle.bodyBlackMedium
                            .copyWith(color: primary),
                      ),
                      TextSpan(
                          text: warehouse.city ?? '',
                          style: TypographyStyle.bodyRegularMedium),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
