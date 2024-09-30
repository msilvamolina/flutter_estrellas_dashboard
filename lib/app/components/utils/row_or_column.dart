import 'package:flutter/material.dart';

class RowOrColumn extends StatelessWidget {
  const RowOrColumn(
      {required this.children, required this.breakingPoint, super.key});
  final List<Widget> children;
  final bool breakingPoint;
  @override
  Widget build(BuildContext context) {
    return breakingPoint
        ? Row(
            children: children,
          )
        : Column(
            children: children,
          );
  }
}
