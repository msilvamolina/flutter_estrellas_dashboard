import 'package:flutter/material.dart';

class SizedBoxResponsive extends StatelessWidget {
  const SizedBoxResponsive({
    required this.value,
    required this.breakingPoint,
    super.key,
  });
  final double value;
  final bool breakingPoint;
  @override
  Widget build(BuildContext context) {
    return breakingPoint ? SizedBox(width: value) : SizedBox(height: value);
  }
}
