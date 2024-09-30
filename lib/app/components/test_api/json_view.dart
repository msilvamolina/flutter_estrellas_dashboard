import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_editor/json_editor.dart';

class JsonView extends StatelessWidget {
  const JsonView({required this.json, super.key});
  final dynamic json;

  @override
  Widget build(BuildContext context) {
    return JsonEditorTheme(
      themeData: JsonEditorThemeData(
        darkTheme: JsonEditorThemeData.defaultTheme().darkTheme!.copyWith(
              defaultStyle:
                  TextStyle(color: Theme.of(context).colorScheme.primary),
              errorStyle: TextStyle(color: Colors.pink[100]),
              keyStyle: TextStyle(color: Colors.white),
              boolStyle: TextStyle(color: Colors.yellow[100]),
              numberStyle: TextStyle(color: Colors.yellow[100]),
              stringStyle: TextStyle(color: Colors.amber),
              bracketStyle: TextStyle(color: Colors.yellow, fontSize: 22),
            ),
        lightTheme: JsonEditorThemeData.defaultTheme().lightTheme!.copyWith(
              defaultStyle:
                  TextStyle(color: Theme.of(context).colorScheme.primary),
              errorStyle: TextStyle(color: Colors.pink),
              keyStyle: TextStyle(color: Colors.white),
              boolStyle: TextStyle(color: Colors.orange),
              numberStyle: TextStyle(color: Colors.orange),
              stringStyle: TextStyle(color: Colors.orange),
              bracketStyle: TextStyle(color: Colors.purple, fontSize: 22),
            ),
      ),
      child: JsonEditor.object(
        enabled: false,
        object: json,
      ),
    );
  }
}
