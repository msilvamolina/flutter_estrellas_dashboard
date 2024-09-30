import 'package:flutter/material.dart';

import '../../themes/styles/typography.dart';

class SuccessCard extends StatelessWidget {
  const SuccessCard({
    required this.success,
    required this.statusCode,
    super.key,
  });
  final String success;
  final String statusCode;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'success: ',
                  style: TypographyStyle.bodyBlackLarge,
                ),
                Text(
                  success,
                  style: TypographyStyle.bodyBlackMedium,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'status code: ',
                  style: TypographyStyle.bodyBlackLarge,
                ),
                Text(
                  statusCode,
                  style: TypographyStyle.bodyBlackMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
