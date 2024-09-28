import "package:flutter/material.dart";

import "../util.dart";

class CyanMaterialTheme {
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278216822),
      surfaceTint: Color(4278216822),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280731615),
      onPrimaryContainer: Color(4278202166),
      secondary: Color(4281820526),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4290768890),
      onSecondaryContainer: Color(4280373594),
      tertiary: Color(4278216822),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280731615),
      onTertiaryContainer: Color(4278202166),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294245116),
      onSurface: Color(4279639326),
      onSurfaceVariant: Color(4282141004),
      outline: Color(4285299068),
      outlineVariant: Color(4290496972),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020723),
      inversePrimary: Color(4282702065),
      primaryFixed: Color(4288802815),
      onPrimaryFixed: Color(4278198053),
      primaryFixedDim: Color(4282702065),
      onPrimaryFixedVariant: Color(4278210137),
      secondaryFixed: Color(4290505717),
      onSecondaryFixed: Color(4278198053),
      secondaryFixedDim: Color(4288663257),
      onSecondaryFixedVariant: Color(4280044886),
      tertiaryFixed: Color(4288802815),
      onTertiaryFixed: Color(4278198053),
      tertiaryFixedDim: Color(4282702065),
      onTertiaryFixedVariant: Color(4278210137),
      surfaceDim: Color(4292205533),
      surfaceBright: Color(4294245116),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916150),
      surfaceContainer: Color(4293521392),
      surfaceContainerHigh: Color(4293126635),
      surfaceContainerHighest: Color(4292731877),
    );
  }

  ThemeData light(BuildContext context) {
    TextTheme textTheme = createTextTheme(context);
    ColorScheme colorScheme = lightScheme();
    return theme(colorScheme).copyWith(
      textTheme: textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
    );
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278209109),
      surfaceTint: Color(4278216822),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278222993),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279716178),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283333765),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278209109),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278222993),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294245116),
      onSurface: Color(4279639326),
      onSurfaceVariant: Color(4281877832),
      outline: Color(4283720036),
      outlineVariant: Color(4285562240),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020723),
      inversePrimary: Color(4282702065),
      primaryFixed: Color(4278222993),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278216307),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4283333765),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281623404),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278222993),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278216307),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292205533),
      surfaceBright: Color(4294245116),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916150),
      surfaceContainer: Color(4293521392),
      surfaceContainerHigh: Color(4293126635),
      surfaceContainerHighest: Color(4292731877),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278200109),
      surfaceTint: Color(4278216822),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278209109),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278200109),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4279716178),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278200109),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278209109),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294245116),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4279838249),
      outline: Color(4281877832),
      outlineVariant: Color(4281877832),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020723),
      inversePrimary: Color(4291097855),
      primaryFixed: Color(4278209109),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278202938),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4279716178),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278202938),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278209109),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278202938),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292205533),
      surfaceBright: Color(4294245116),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916150),
      surfaceContainer: Color(4293521392),
      surfaceContainerHigh: Color(4293126635),
      surfaceContainerHighest: Color(4292731877),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4283227894),
      surfaceTint: Color(4282702065),
      onPrimary: Color(4278203966),
      primaryContainer: Color(4278236106),
      onPrimaryContainer: Color(4278197024),
      secondary: Color(4288663257),
      onSecondary: Color(4278203966),
      secondaryContainer: Color(4279190348),
      onSecondaryContainer: Color(4289321187),
      tertiary: Color(4283227894),
      onTertiary: Color(4278203966),
      tertiaryContainer: Color(4278236106),
      onTertiaryContainer: Color(4278197024),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279112726),
      onSurface: Color(4292731877),
      onSurfaceVariant: Color(4290496972),
      outline: Color(4287009686),
      outlineVariant: Color(4282141004),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292731877),
      inversePrimary: Color(4278216822),
      primaryFixed: Color(4288802815),
      onPrimaryFixed: Color(4278198053),
      primaryFixedDim: Color(4282702065),
      onPrimaryFixedVariant: Color(4278210137),
      secondaryFixed: Color(4290505717),
      onSecondaryFixed: Color(4278198053),
      secondaryFixedDim: Color(4288663257),
      onSecondaryFixedVariant: Color(4280044886),
      tertiaryFixed: Color(4288802815),
      onTertiaryFixed: Color(4278198053),
      tertiaryFixedDim: Color(4282702065),
      onTertiaryFixedVariant: Color(4278210137),
      surfaceDim: Color(4279112726),
      surfaceBright: Color(4281612860),
      surfaceContainerLowest: Color(4278783761),
      surfaceContainerLow: Color(4279639326),
      surfaceContainer: Color(4279902498),
      surfaceContainerHigh: Color(4280625964),
      surfaceContainerHighest: Color(4281284151),
    );
  }

  ThemeData dark(BuildContext context) {
    TextTheme textTheme = createTextTheme(context);
    ColorScheme colorScheme = darkScheme();
    return theme(colorScheme).copyWith(
      textTheme: textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
    );
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4283227894),
      surfaceTint: Color(4282702065),
      onPrimary: Color(4278197024),
      primaryContainer: Color(4278236106),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4288926685),
      onSecondary: Color(4278196766),
      secondaryContainer: Color(4285175970),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4283227894),
      onTertiary: Color(4278197024),
      tertiaryContainer: Color(4278236106),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279112726),
      onSurface: Color(4294376701),
      onSurfaceVariant: Color(4290760144),
      outline: Color(4288193960),
      outlineVariant: Color(4286088585),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292731877),
      inversePrimary: Color(4278210651),
      primaryFixed: Color(4288802815),
      onPrimaryFixed: Color(4278195224),
      primaryFixedDim: Color(4282702065),
      onPrimaryFixedVariant: Color(4278205509),
      secondaryFixed: Color(4290505717),
      onSecondaryFixed: Color(4278195224),
      secondaryFixedDim: Color(4288663257),
      onSecondaryFixedVariant: Color(4278467653),
      tertiaryFixed: Color(4288802815),
      onTertiaryFixed: Color(4278195224),
      tertiaryFixedDim: Color(4282702065),
      onTertiaryFixedVariant: Color(4278205509),
      surfaceDim: Color(4279112726),
      surfaceBright: Color(4281612860),
      surfaceContainerLowest: Color(4278783761),
      surfaceContainerLow: Color(4279639326),
      surfaceContainer: Color(4279902498),
      surfaceContainerHigh: Color(4280625964),
      surfaceContainerHighest: Color(4281284151),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294114559),
      surfaceTint: Color(4282702065),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4283161845),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294114559),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4288926685),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294114559),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4283161845),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279112726),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294114559),
      outline: Color(4290760144),
      outlineVariant: Color(4290760144),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292731877),
      inversePrimary: Color(4278202166),
      primaryFixed: Color(4289851903),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4283161845),
      onPrimaryFixedVariant: Color(4278196766),
      secondaryFixed: Color(4290768890),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4288926685),
      onSecondaryFixedVariant: Color(4278196766),
      tertiaryFixed: Color(4289851903),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4283161845),
      onTertiaryFixedVariant: Color(4278196766),
      surfaceDim: Color(4279112726),
      surfaceBright: Color(4281612860),
      surfaceContainerLowest: Color(4278783761),
      surfaceContainerLow: Color(4279639326),
      surfaceContainer: Color(4279902498),
      surfaceContainerHigh: Color(4280625964),
      surfaceContainerHighest: Color(4281284151),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
