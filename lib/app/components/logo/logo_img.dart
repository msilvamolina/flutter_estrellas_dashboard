import 'package:flutter/material.dart';

class LogoImg extends StatelessWidget {
  const LogoImg({
    required this.size,
    required this.backgroundImage,
    required this.colorImage,
    super.key,
  });

  final double size;
  final Color backgroundImage;
  final Color colorImage;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: Stack(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              backgroundImage, // El color al que quieres convertir la imagen
              BlendMode.srcIn, // Aplica el color a la imagen
            ),
            child: Image.asset(
              'assets/images/logo.png',
              width: size,
            ),
          ),
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              colorImage, // El color al que quieres convertir la imagen
              BlendMode.srcIn, // Aplica el color a la imagen
            ),
            child: Image.asset(
              'assets/images/logo2.png',
              width: size,
            ),
          ),
        ],
      ),
    );
  }
}
