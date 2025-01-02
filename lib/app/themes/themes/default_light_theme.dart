import 'package:flutter/material.dart';

import '../styles/colors.dart';

ThemeData defaultLightTheme = ThemeData(
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: primaryBase, // Color del cursor.
    selectionColor:
        primaryBase.withOpacity(0.2), // Selección con transparencia.
    selectionHandleColor: primaryBase, // Color de los manejadores.
  ),
  colorScheme: ColorScheme(
    primary: secondaryBase,
    primaryContainer: primaryBase,
    secondary: primaryBase,
    secondaryContainer: secondaryBase,
    surface: Colors.white,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  useMaterial3: true,
);
