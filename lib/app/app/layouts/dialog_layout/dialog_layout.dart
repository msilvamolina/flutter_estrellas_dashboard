import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/responsive.dart';

class DialogLayout extends StatelessWidget {
  const DialogLayout({required this.child, super.key});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: Get.back,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16), // Desenfoque
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.all(Responsive.isMobile(context) ? 0 : 30),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    Responsive.isMobile(context) ? 0 : 36)),
            constraints: BoxConstraints(
                maxWidth: Responsive.isMobile(context) ? double.infinity : 480),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(Responsive.isMobile(context) ? 0 : 20),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
