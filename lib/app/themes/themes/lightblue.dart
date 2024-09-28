import "package:flutter/material.dart";

import "../util.dart";

class LightBlueMaterialTheme {
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278215827),
      surfaceTint: Color(4278215827),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281513471),
      onPrimaryContainer: Color(4278199095),
      secondary: Color(4282081919),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4290699775),
      onSecondaryContainer: Color(4280174691),
      tertiary: Color(4278215827),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4281513471),
      onTertiaryContainer: Color(4278199095),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294375935),
      onSurface: Color(4279704609),
      onSurfaceVariant: Color(4282271825),
      outline: Color(4285429890),
      outlineVariant: Color(4290693330),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086262),
      inversePrimary: Color(4287483391),
      primaryFixed: Color(4291487487),
      onPrimaryFixed: Color(4278197808),
      primaryFixedDim: Color(4287483391),
      onPrimaryFixedVariant: Color(4278209392),
      secondaryFixed: Color(4291487487),
      onSecondaryFixed: Color(4278197808),
      secondaryFixedDim: Color(4288990188),
      onSecondaryFixedVariant: Color(4280371814),
      tertiaryFixed: Color(4291487487),
      onTertiaryFixed: Color(4278197808),
      tertiaryFixedDim: Color(4287483391),
      onTertiaryFixedVariant: Color(4278209392),
      surfaceDim: Color(4292270817),
      surfaceBright: Color(4294375935),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981434),
      surfaceContainer: Color(4293586677),
      surfaceContainerHigh: Color(4293191919),
      surfaceContainerHighest: Color(4292797417),
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
      primary: Color(4278208362),
      surfaceTint: Color(4278215827),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278222004),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280043106),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283595158),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278208362),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278222004),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294375935),
      onSurface: Color(4279704609),
      onSurfaceVariant: Color(4282008653),
      outline: Color(4283850857),
      outlineVariant: Color(4285693062),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086262),
      inversePrimary: Color(4287483391),
      primaryFixed: Color(4278222004),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278215311),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4283595158),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281950332),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278222004),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278215311),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292270817),
      surfaceBright: Color(4294375935),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981434),
      surfaceContainer: Color(4293586677),
      surfaceContainerHigh: Color(4293191919),
      surfaceContainerHighest: Color(4292797417),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278199609),
      surfaceTint: Color(4278215827),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278208362),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278199609),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4280043106),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278199609),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278208362),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294375935),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4279969069),
      outline: Color(4282008653),
      outlineVariant: Color(4282008653),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086262),
      inversePrimary: Color(4292734719),
      primaryFixed: Color(4278208362),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278202441),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4280043106),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278202441),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278208362),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278202441),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292270817),
      surfaceBright: Color(4294375935),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293981434),
      surfaceContainer: Color(4293586677),
      surfaceContainerHigh: Color(4293191919),
      surfaceContainerHighest: Color(4292797417),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4287483391),
      surfaceTint: Color(4287483391),
      onPrimary: Color(4278203471),
      primaryContainer: Color(4278231528),
      onPrimaryContainer: Color(4278191371),
      secondary: Color(4288990188),
      onSecondary: Color(4278269006),
      secondaryContainer: Color(4279582812),
      onSecondaryContainer: Color(4289648118),
      tertiary: Color(4287483391),
      onTertiary: Color(4278203471),
      tertiaryContainer: Color(4278231528),
      onTertiaryContainer: Color(4278191371),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279178264),
      onSurface: Color(4292797417),
      onSurfaceVariant: Color(4290693330),
      outline: Color(4287140508),
      outlineVariant: Color(4282271825),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797417),
      inversePrimary: Color(4278215827),
      primaryFixed: Color(4291487487),
      onPrimaryFixed: Color(4278197808),
      primaryFixedDim: Color(4287483391),
      onPrimaryFixedVariant: Color(4278209392),
      secondaryFixed: Color(4291487487),
      onSecondaryFixed: Color(4278197808),
      secondaryFixedDim: Color(4288990188),
      onSecondaryFixedVariant: Color(4280371814),
      tertiaryFixed: Color(4291487487),
      onTertiaryFixed: Color(4278197808),
      tertiaryFixedDim: Color(4287483391),
      onTertiaryFixedVariant: Color(4278209392),
      surfaceDim: Color(4279178264),
      surfaceBright: Color(4281678399),
      surfaceContainerLowest: Color(4278849299),
      surfaceContainerLow: Color(4279704609),
      surfaceContainer: Color(4279967781),
      surfaceContainerHigh: Color(4280625967),
      surfaceContainerHighest: Color(4281349434),
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
      primary: Color(4288139775),
      surfaceTint: Color(4287483391),
      onPrimary: Color(4278196264),
      primaryContainer: Color(4278231528),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4289253360),
      onSecondary: Color(4278196264),
      secondaryContainer: Color(4285437364),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4288139775),
      onTertiary: Color(4278196264),
      tertiaryContainer: Color(4278231528),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279178264),
      onSurface: Color(4294573055),
      onSurfaceVariant: Color(4290956503),
      outline: Color(4288324782),
      outlineVariant: Color(4286219406),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797417),
      inversePrimary: Color(4278209906),
      primaryFixed: Color(4291487487),
      onPrimaryFixed: Color(4278194976),
      primaryFixedDim: Color(4287483391),
      onPrimaryFixedVariant: Color(4278205015),
      secondaryFixed: Color(4291487487),
      onSecondaryFixed: Color(4278194976),
      secondaryFixedDim: Color(4288990188),
      onSecondaryFixedVariant: Color(4278860372),
      tertiaryFixed: Color(4291487487),
      onTertiaryFixed: Color(4278194976),
      tertiaryFixedDim: Color(4287483391),
      onTertiaryFixedVariant: Color(4278205015),
      surfaceDim: Color(4279178264),
      surfaceBright: Color(4281678399),
      surfaceContainerLowest: Color(4278849299),
      surfaceContainerLow: Color(4279704609),
      surfaceContainer: Color(4279967781),
      surfaceContainerHigh: Color(4280625967),
      surfaceContainerHighest: Color(4281349434),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294573055),
      surfaceTint: Color(4287483391),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4288139775),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294573055),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4289253360),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294573055),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4288139775),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279178264),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294573055),
      outline: Color(4290956503),
      outlineVariant: Color(4290956503),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797417),
      inversePrimary: Color(4278201669),
      primaryFixed: Color(4292078335),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4288139775),
      onPrimaryFixedVariant: Color(4278196264),
      secondaryFixed: Color(4292078335),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4289253360),
      onSecondaryFixedVariant: Color(4278196264),
      tertiaryFixed: Color(4292078335),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4288139775),
      onTertiaryFixedVariant: Color(4278196264),
      surfaceDim: Color(4279178264),
      surfaceBright: Color(4281678399),
      surfaceContainerLowest: Color(4278849299),
      surfaceContainerLow: Color(4279704609),
      surfaceContainer: Color(4279967781),
      surfaceContainerHigh: Color(4280625967),
      surfaceContainerHighest: Color(4281349434),
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
