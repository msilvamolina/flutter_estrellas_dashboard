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
      color: Colors.transparent,
      child: Obx(
        () => AbsorbPointer(
          absorbing: true,
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 26, sigmaY: 26),
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 500),
                  crossFadeState: mainController.dropiDialog.value
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: Container(
                    color: Colors.orange[800]!.withOpacity(0.5),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  secondChild: Container(
                    color: Colors.green[800]!.withOpacity(0.5),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              Center(
                child: Hero(
                  tag: 'logo',
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedCrossFade(
                          duration: const Duration(milliseconds: 500),
                          crossFadeState: mainController.dropiDialog.value
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          firstChild: Shimmer.fromColors(
                            baseColor: Colors.orange,
                            highlightColor: Colors.yellowAccent,
                            child: SvgPicture.asset(
                              'assets/svg/dropi.svg',
                              width: 140,
                            ),
                          ),
                          secondChild: Shimmer.fromColors(
                            baseColor: Colors.green,
                            highlightColor: Colors.greenAccent,
                            child: SvgPicture.asset(
                              'assets/svg/logo.svg',
                              width: 180,
                            ),
                          ),
                        ),

                        AnimatedCrossFade(
                          duration: const Duration(milliseconds: 500),
                          crossFadeState: mainController.dropiDialog.value
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          firstChild: Padding(
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
                          secondChild: Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              "Conectando con Estrellas 2.0",
                              textAlign: TextAlign.center,
                              style: TypographyStyle.bodyBlackLarge.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),

                        // if (title != null && message != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            mainController.dropiMessage.value,
                            textAlign: TextAlign.center,
                            style: TypographyStyle.bodyRegularMedium
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
