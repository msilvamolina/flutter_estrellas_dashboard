import 'package:flutter/material.dart';

class WidgetOrWidget extends StatelessWidget {
  const WidgetOrWidget({
    required this.child,
    required this.secondChild,
    required this.breakingPoint,
    super.key,
  });
  final Widget child;
  final Widget secondChild;
  final bool breakingPoint;
  @override
  Widget build(BuildContext context) {
    return breakingPoint ? child : secondChild;
  }
}
