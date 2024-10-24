import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    super.key,
  });
  final String label;
  final IconData icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    if (!Responsive.isTablet2(context))
      return FloatingActionButton.extended(
        label: Text(label),
        icon: Icon(icon),
        onPressed: onPressed,
      );
    else
      return FloatingActionButton(
        child: Icon(icon),
        onPressed: onPressed,
      );
  }
}
