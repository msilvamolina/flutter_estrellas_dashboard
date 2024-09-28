import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_mariscal/app/app/controllers/main_controller.dart';

class AuthLayout extends StatefulWidget {
  const AuthLayout({
    required this.child,
    this.showBackground = true,
    super.key,
  });
  final Widget child;
  final bool showBackground;
  @override
  _AuthLayoutState createState() => _AuthLayoutState();
}

class _AuthLayoutState extends State<AuthLayout> {
  double _circle1TopInitial = -100;
  double _circle1TopFinal = 80;

  double _circle1LeftInitial = -50;
  double _circle1LeftFinal = 100;

  double _circle2TopInitial = 20;
  double _circle2TopFinal = 100;

  double _circle2LeftInitial = -50;
  double _circle2LeftFinal = 100;

  late double _circle1Top;
  late double _circle1Left;

  late double _circle2Left;
  late double _circle2Top;

  bool initialPosition = true;

  @override
  void initState() {
    super.initState();
    _circle1Top = _circle1TopInitial;
    _circle1Left = _circle1LeftInitial;

    _circle2Top = _circle2TopInitial;
    _circle2Left = _circle2LeftInitial;

    Timer.periodic(const Duration(seconds: 10), (timer) {
      setState(() {
        _circle1Top = _circle1Top == _circle1TopInitial
            ? _circle1TopFinal
            : _circle1TopInitial;
        _circle1Left = _circle1Left == _circle1LeftInitial
            ? _circle1LeftFinal
            : _circle1LeftInitial;
        _circle2Top = _circle2Top == _circle2TopInitial
            ? _circle2TopFinal
            : _circle2TopInitial;
        _circle2Left = _circle2Left == _circle2LeftInitial
            ? _circle2LeftFinal
            : _circle2LeftInitial;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find();

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double verticalHalf = screenHeight * 0.7;
    bool isMobile = screenWidth < 480;

    bool isDark = mainController.isThemeModeDark;

    Color backgroundColor2 = Theme.of(context).colorScheme.inversePrimary;
    Color backgroundColor = Theme.of(context).colorScheme.primary;

    Color primaryColor = Theme.of(context).colorScheme.inversePrimary;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: isDark ? 0.2 : 1,
                colors: isDark
                    ? [
                        backgroundColor,
                        Colors.black,
                      ]
                    : [
                        backgroundColor2,
                        backgroundColor,
                      ],
              ),
            ),
          ),
          // Círculo 1 animado
          AnimatedPositioned(
            duration: Duration(seconds: 30),
            top: _circle1Top + verticalHalf,
            right: _circle1Left,
            child: _buildCircle(500, primaryColor.withOpacity(0.5)),
          ),
          // Círculo 2 animado
          AnimatedPositioned(
            duration: Duration(seconds: 40),
            top: _circle2Top + verticalHalf,
            left: _circle2Left,
            child: _buildCircle(600, primaryColor.withOpacity(0.5)),
          ),
          Container(
            width: double.infinity, // Escalar para pantalla
            height: double.infinity, // Escalar para pantalla
            child: ClipRRect(
              child: BackdropFilter(
                filter:
                    ImageFilter.blur(sigmaX: 5000, sigmaY: 5000), // Desenfoque
                child: Container(
                  child: widget.showBackground
                      ? Center(
                          child: Container(
                            margin: EdgeInsets.all(isMobile ? 0 : 60),
                            width: double.infinity, // Escalar para pantalla
                            height: double.infinity,
                            // Escalar para pantalla
                            constraints: BoxConstraints(maxWidth: 480),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(isMobile ? 0 : 20),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: 5000, sigmaY: 5000),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: backgroundColor
                                        .withOpacity(isMobile ? 1 : 0.2),
                                    borderRadius: BorderRadius.circular(
                                        isMobile ? 0 : 20),
                                  ),
                                  child: widget.child,
                                ),
                              ),
                            ),
                          ),
                        )
                      : widget.child,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Función para construir un círculo
  Widget _buildCircle(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
