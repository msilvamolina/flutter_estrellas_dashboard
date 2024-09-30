import 'package:flutter/material.dart';

class ExpandedOrNull extends StatelessWidget {
  const ExpandedOrNull(
      {required this.child, required this.breakingPoint, super.key});
  final Widget child;
  final bool breakingPoint;
  @override
  Widget build(BuildContext context) {
    return breakingPoint
        ? Expanded(
            child: child,
          )
        : child;
  }
}
