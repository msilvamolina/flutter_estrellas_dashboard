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
          children: [
            Text(
              'API: ',
              style: TypographyStyle.bodyBlackLarge,
            ),
            Text(
              ApiServices.baseUrl,
              style: TypographyStyle.bodyBlackMedium,
            ),
          ],
        ),
        SizedBox(height: 8),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            Text(
              'Endpoint: ',
              style: TypographyStyle.bodyBlackLarge,
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
