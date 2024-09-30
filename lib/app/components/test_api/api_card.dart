import 'package:flutter/material.dart';

import '../../services/api_services.dart';
import '../../themes/styles/typography.dart';

class ApiCard extends StatelessWidget {
  const ApiCard({
    required this.url,
    super.key,
  });
  final String url;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          verticalDirection: VerticalDirection.up,
          children: [
            Text(
              'API: ',
              style: TypographyStyle.bodyBlackLarge
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              ApiServices.baseUrl,
              style: TypographyStyle.bodyBlackMedium,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          verticalDirection: VerticalDirection.up,
          children: [
            Text(
              'Endpoint: ',
              style: TypographyStyle.bodyBlackLarge
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              url,
              style: TypographyStyle.bodyBlackMedium,
            ),
          ],
        ),
      ],
    );
  }
}
