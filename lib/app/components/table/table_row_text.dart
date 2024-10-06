import 'package:flutter/material.dart';

class TableRowText extends StatelessWidget {
  const TableRowText({required this.text, super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return SelectableText(text);
  }
}
