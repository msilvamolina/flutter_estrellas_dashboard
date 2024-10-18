import 'dart:ui';

import 'package:estrellas_dashboard/app/app/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class LoaderDropiDialog extends StatelessWidget {
  const LoaderDropiDialog({super.key});

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();

    return Material(
      color: Colors.orange[800]!.withOpacity(0.2),
      child: AbsorbPointer(
        absorbing: true,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 26, sigmaY: 26),
          child: Center(
            child: Hero(
              tag: 'logo',
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.orange,
                      highlightColor: Colors.yellow,
                      child: SvgPicture.asset(
                        'assets/svg/dropi.svg',
                        width: 140,
                      ),
                    ),
                    // if (title != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        "Conectando con dropi",
                        textAlign: TextAlign.center,
                        style: TypographyStyle.bodyBlackLarge.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    // if (title != null && message != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Obx(
                        () => Text(
                          mainController.dropiMessage.value,
                          textAlign: TextAlign.center,
                          style: TypographyStyle.bodyRegularSmall
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
