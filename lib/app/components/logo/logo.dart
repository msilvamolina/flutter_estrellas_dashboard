import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({required this.size, super.key});

  final double size;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/logo.svg',
      height: 180,
      colorFilter: ColorFilter.mode(
        Theme.of(context).colorScheme.primary,
        BlendMode.srcIn,
      ),
    );
  }
}
