import 'package:flutter/material.dart';

class ThemeModel {
  ThemeModel({
    required this.id,
    required this.name,
    required this.color,
    required this.theme,
  });

  final String id;
  final String name;
  final Color color;
  final dynamic theme;
}
