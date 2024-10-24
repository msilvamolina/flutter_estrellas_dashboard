import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_editor/json_editor.dart';

class JsonView extends StatelessWidget {
  const JsonView({required this.json, super.key});
  final dynamic json;

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).colorScheme.primary;
    Color secondary = Theme.of(context).colorScheme.onErrorContainer;

    return JsonEditorTheme(
      themeData: JsonEditorThemeData(
        darkTheme: JsonEditorThemeData.defaultTheme().darkTheme!.copyWith(
              defaultStyle: TextStyle(color: primary),
              errorStyle: TextStyle(color: Colors.pink[100]),
              keyStyle: TextStyle(color: secondary),
              boolStyle: TextStyle(color: Colors.green[100]),
              numberStyle: TextStyle(color: Colors.yellow[100]),
              stringStyle: TextStyle(color: primary),
              bracketStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
        lightTheme: JsonEditorThemeData.defaultTheme().lightTheme!.copyWith(
              defaultStyle:
                  TextStyle(color: Theme.of(context).colorScheme.primary),
              errorStyle: TextStyle(color: Colors.pink),
              keyStyle: TextStyle(color: secondary),
              boolStyle:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.w700),
              numberStyle: TextStyle(color: Colors.orange),
              stringStyle: TextStyle(color: primary),
              bracketStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
      ),
      child: JsonEditor.object(
        enabled: false,
        object: json,
      ),
    );
  }
}
