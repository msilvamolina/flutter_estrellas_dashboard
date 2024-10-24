import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../themes/styles/typography.dart';
import '../../utils/responsive.dart';

class AppbarTitleWithBack extends StatelessWidget {
  const AppbarTitleWithBack({required this.title, super.key});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: !Responsive.isTablet2(context)
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      mainAxisAlignment: Responsive.isTablet2(context)
          ? MainAxisAlignment.start
          : MainAxisAlignment.center,
      children: [
        if (Responsive.isTablet2(context) && !Responsive.isMobile(context)) ...[
          IconButton(
            onPressed: Get.back,
            icon: const Icon(
              Icons.chevron_left,
              size: 34,
            ),
          ),
        ],
        Padding(
          padding:
              EdgeInsets.only(bottom: !Responsive.isTablet2(context) ? 8 : 0),
          child: Text(
            title,
            style: TypographyStyle.h3Mobile,
          ),
        ),
      ],
    );
  }
}
