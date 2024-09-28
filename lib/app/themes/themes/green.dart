import "package:flutter/material.dart";

import "../util.dart";

class GreenMaterialTheme {
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278218268),
      surfaceTint: Color(4278218268),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284005467),
      onPrimaryContainer: Color(4278198788),
      secondary: Color(4282541887),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291293887),
      onSecondaryContainer: Color(4281291565),
      tertiary: Color(4278218268),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4284005467),
      onTertiaryContainer: Color(4278198788),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294310895),
      onSurface: Color(4279704854),
      onSurfaceVariant: Color(4282337852),
      outline: Color(4285495915),
      outlineVariant: Color(4290693817),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086506),
      inversePrimary: Color(4286110839),
      primaryFixed: Color(4287953296),
      onPrimaryFixed: Color(4278198788),
      primaryFixedDim: Color(4286110839),
      onPrimaryFixedVariant: Color(4278211347),
      secondaryFixed: Color(4291030715),
      onSecondaryFixed: Color(4278198788),
      secondaryFixedDim: Color(4289253793),
      onSecondaryFixedVariant: Color(4281028394),
      tertiaryFixed: Color(4287953296),
      onTertiaryFixed: Color(4278198788),
      tertiaryFixedDim: Color(4286110839),
      onTertiaryFixedVariant: Color(4278211347),
      surfaceDim: Color(4292271312),
      surfaceBright: Color(4294310895),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981930),
      surfaceContainer: Color(4293587172),
      surfaceContainerHigh: Color(4293192414),
      surfaceContainerHighest: Color(4292797657),
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
      primary: Color(4278210321),
      surfaceTint: Color(4278218268),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280190509),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280765222),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283989588),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278210321),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280190509),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294310895),
      onSurface: Color(4279704854),
      onSurfaceVariant: Color(4282074681),
      outline: Color(4283916884),
      outlineVariant: Color(4285759087),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086506),
      inversePrimary: Color(4286110839),
      primaryFixed: Color(4280190509),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278217499),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4283989588),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282410301),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4280190509),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278217499),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292271312),
      surfaceBright: Color(4294310895),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981930),
      surfaceContainer: Color(4293587172),
      surfaceContainerHigh: Color(4293192414),
      surfaceContainerHighest: Color(4292797657),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278200581),
      surfaceTint: Color(4278218268),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278210321),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278462728),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4280765222),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278200581),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278210321),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294310895),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280100379),
      outline: Color(4282074681),
      outlineVariant: Color(4282074681),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086506),
      inversePrimary: Color(4289855402),
      primaryFixed: Color(4278210321),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278203657),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4280765222),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4279251986),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278210321),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278203657),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292271312),
      surfaceBright: Color(4294310895),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981930),
      surfaceContainer: Color(4293587172),
      surfaceContainerHigh: Color(4293192414),
      surfaceContainerHighest: Color(4292797657),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4286110839),
      surfaceTint: Color(4286110839),
      onPrimary: Color(4278204682),
      primaryContainer: Color(4282623560),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4289253793),
      onSecondary: Color(4279515157),
      secondaryContainer: Color(4280436001),
      onSecondaryContainer: Color(4289911979),
      tertiary: Color(4286110839),
      onTertiary: Color(4278204682),
      tertiaryContainer: Color(4282623560),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279178510),
      onSurface: Color(4292797657),
      onSurfaceVariant: Color(4290693817),
      outline: Color(4287206532),
      outlineVariant: Color(4282337852),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797657),
      inversePrimary: Color(4278218268),
      primaryFixed: Color(4287953296),
      onPrimaryFixed: Color(4278198788),
      primaryFixedDim: Color(4286110839),
      onPrimaryFixedVariant: Color(4278211347),
      secondaryFixed: Color(4291030715),
      onSecondaryFixed: Color(4278198788),
      secondaryFixedDim: Color(4289253793),
      onSecondaryFixedVariant: Color(4281028394),
      tertiaryFixed: Color(4287953296),
      onTertiaryFixed: Color(4278198788),
      tertiaryFixedDim: Color(4286110839),
      onTertiaryFixedVariant: Color(4278211347),
      surfaceDim: Color(4279178510),
      surfaceBright: Color(4281678643),
      surfaceContainerLowest: Color(4278849545),
      surfaceContainerLow: Color(4279704854),
      surfaceContainer: Color(4279968026),
      surfaceContainerHigh: Color(4280691748),
      surfaceContainerHighest: Color(4281349678),
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
      primary: Color(4286374267),
      surfaceTint: Color(4286110839),
      onPrimary: Color(4278196995),
      primaryContainer: Color(4282623560),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4289517221),
      onSecondary: Color(4278196995),
      secondaryContainer: Color(4285766510),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4286374267),
      onTertiary: Color(4278196995),
      tertiaryContainer: Color(4282623560),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279178510),
      onSurface: Color(4294442481),
      onSurfaceVariant: Color(4290956989),
      outline: Color(4288390806),
      outlineVariant: Color(4286285431),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797657),
      inversePrimary: Color(4278211603),
      primaryFixed: Color(4287953296),
      onPrimaryFixed: Color(4278195714),
      primaryFixedDim: Color(4286110839),
      onPrimaryFixedVariant: Color(4278206476),
      secondaryFixed: Color(4291030715),
      onSecondaryFixed: Color(4278195714),
      secondaryFixedDim: Color(4289253793),
      onSecondaryFixedVariant: Color(4279909914),
      tertiaryFixed: Color(4287953296),
      onTertiaryFixed: Color(4278195714),
      tertiaryFixedDim: Color(4286110839),
      onTertiaryFixedVariant: Color(4278206476),
      surfaceDim: Color(4279178510),
      surfaceBright: Color(4281678643),
      surfaceContainerLowest: Color(4278849545),
      surfaceContainerLow: Color(4279704854),
      surfaceContainer: Color(4279968026),
      surfaceContainerHigh: Color(4280691748),
      surfaceContainerHighest: Color(4281349678),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294049770),
      surfaceTint: Color(4286110839),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4286374267),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294049770),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4289517221),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294049770),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4286374267),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279178510),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294180588),
      outline: Color(4290956989),
      outlineVariant: Color(4290956989),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797657),
      inversePrimary: Color(4278202888),
      primaryFixed: Color(4288216724),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4286374267),
      onPrimaryFixedVariant: Color(4278196995),
      secondaryFixed: Color(4291359424),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4289517221),
      onSecondaryFixedVariant: Color(4278196995),
      tertiaryFixed: Color(4288216724),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4286374267),
      onTertiaryFixedVariant: Color(4278196995),
      surfaceDim: Color(4279178510),
      surfaceBright: Color(4281678643),
      surfaceContainerLowest: Color(4278849545),
      surfaceContainerLow: Color(4279704854),
      surfaceContainer: Color(4279968026),
      surfaceContainerHigh: Color(4280691748),
      surfaceContainerHighest: Color(4281349678),
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
