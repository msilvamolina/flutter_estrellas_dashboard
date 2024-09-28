import "package:flutter/material.dart";

import "../util.dart";

class PinkMaterialTheme {
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4288806975),
      surfaceTint: Color(4290510923),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4293006943),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4289147985),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294937248),
      onSecondaryContainer: Color(4283236378),
      tertiary: Color(4288806975),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4293006943),
      onTertiaryContainer: Color(4294967295),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294965495),
      onSurface: Color(4280817434),
      onSurfaceVariant: Color(4284170051),
      outline: Color(4287590259),
      outlineVariant: Color(4293180866),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4282264366),
      inversePrimary: Color(4294947518),
      primaryFixed: Color(4294957534),
      onPrimaryFixed: Color(4282384404),
      primaryFixedDim: Color(4294947518),
      onPrimaryFixedVariant: Color(4287627320),
      secondaryFixed: Color(4294957534),
      onSecondaryFixed: Color(4282384404),
      secondaryFixedDim: Color(4294947518),
      onSecondaryFixedVariant: Color(4287044154),
      tertiaryFixed: Color(4294957534),
      onTertiaryFixed: Color(4282384404),
      tertiaryFixedDim: Color(4294947518),
      onTertiaryFixedVariant: Color(4287627320),
      surfaceDim: Color(4294038486),
      surfaceBright: Color(4294965495),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963441),
      surfaceContainer: Color(4294961642),
      surfaceContainerHigh: Color(4294959588),
      surfaceContainerHighest: Color(4294630366),
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
      primary: Color(4287168565),
      surfaceTint: Color(4290510923),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4293006943),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4286715191),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291054182),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4287168565),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4293006943),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965495),
      onSurface: Color(4280817434),
      onSurfaceVariant: Color(4283906880),
      outline: Color(4285945691),
      outlineVariant: Color(4287853175),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4282264366),
      inversePrimary: Color(4294947518),
      primaryFixed: Color(4293006943),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4290248777),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4291054182),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4288950607),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4293006943),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4290248777),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4294038486),
      surfaceBright: Color(4294965495),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963441),
      surfaceContainer: Color(4294961642),
      surfaceContainerHigh: Color(4294959588),
      surfaceContainerHighest: Color(4294630366),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4283170842),
      surfaceTint: Color(4290510923),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4287168565),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4283170842),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4286715191),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4283170842),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4287168565),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965495),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4281670945),
      outline: Color(4283906880),
      outlineVariant: Color(4283906880),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4282264366),
      inversePrimary: Color(4294960872),
      primaryFixed: Color(4287168565),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4284481570),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4286715191),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284481570),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4287168565),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4284481570),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4294038486),
      surfaceBright: Color(4294965495),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963441),
      surfaceContainer: Color(4294961642),
      surfaceContainerHigh: Color(4294959588),
      surfaceContainerHighest: Color(4294630366),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294947518),
      surfaceTint: Color(4294947518),
      onPrimary: Color(4284874789),
      primaryContainer: Color(4292743004),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4294947518),
      onSecondary: Color(4284874789),
      secondaryContainer: Color(4286452276),
      onSecondaryContainer: Color(4294952911),
      tertiary: Color(4294947518),
      onTertiary: Color(4284874789),
      tertiaryContainer: Color(4292743004),
      onTertiaryContainer: Color(4294967295),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4280225554),
      onSurface: Color(4294630366),
      onSurfaceVariant: Color(4293180866),
      outline: Color(4289431692),
      outlineVariant: Color(4284170051),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294630366),
      inversePrimary: Color(4290510923),
      primaryFixed: Color(4294957534),
      onPrimaryFixed: Color(4282384404),
      primaryFixedDim: Color(4294947518),
      onPrimaryFixedVariant: Color(4287627320),
      secondaryFixed: Color(4294957534),
      onSecondaryFixed: Color(4282384404),
      secondaryFixedDim: Color(4294947518),
      onSecondaryFixedVariant: Color(4287044154),
      tertiaryFixed: Color(4294957534),
      onTertiaryFixed: Color(4282384404),
      tertiaryFixedDim: Color(4294947518),
      onTertiaryFixedVariant: Color(4287627320),
      surfaceDim: Color(4280225554),
      surfaceBright: Color(4282922039),
      surfaceContainerLowest: Color(4279831052),
      surfaceContainerLow: Color(4280817434),
      surfaceContainer: Color(4281080606),
      surfaceContainerHigh: Color(4281804072),
      surfaceContainerHighest: Color(4282593330),
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
      primary: Color(4294949059),
      surfaceTint: Color(4294947518),
      onPrimary: Color(4281729040),
      primaryContainer: Color(4294921852),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294949059),
      onSecondary: Color(4281729040),
      secondaryContainer: Color(4293420418),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294949059),
      onTertiary: Color(4281729040),
      tertiaryContainer: Color(4294921852),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4280225554),
      onSurface: Color(4294965753),
      onSurfaceVariant: Color(4293444038),
      outline: Color(4290681502),
      outlineVariant: Color(4288445311),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294630366),
      inversePrimary: Color(4287758393),
      primaryFixed: Color(4294957534),
      onPrimaryFixed: Color(4281073676),
      primaryFixedDim: Color(4294947518),
      onPrimaryFixedVariant: Color(4285595690),
      secondaryFixed: Color(4294957534),
      onSecondaryFixed: Color(4281073676),
      secondaryFixedDim: Color(4294947518),
      onSecondaryFixedVariant: Color(4285530922),
      tertiaryFixed: Color(4294957534),
      onTertiaryFixed: Color(4281073676),
      tertiaryFixedDim: Color(4294947518),
      onTertiaryFixedVariant: Color(4285595690),
      surfaceDim: Color(4280225554),
      surfaceBright: Color(4282922039),
      surfaceContainerLowest: Color(4279831052),
      surfaceContainerLow: Color(4280817434),
      surfaceContainer: Color(4281080606),
      surfaceContainerHigh: Color(4281804072),
      surfaceContainerHighest: Color(4282593330),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294965753),
      surfaceTint: Color(4294947518),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294949059),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965753),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4294949059),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965753),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294949059),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4280225554),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294965753),
      outline: Color(4293444038),
      outlineVariant: Color(4293444038),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294630366),
      inversePrimary: Color(4284153888),
      primaryFixed: Color(4294959075),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294949059),
      onPrimaryFixedVariant: Color(4281729040),
      secondaryFixed: Color(4294959075),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4294949059),
      onSecondaryFixedVariant: Color(4281729040),
      tertiaryFixed: Color(4294959075),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294949059),
      onTertiaryFixedVariant: Color(4281729040),
      surfaceDim: Color(4280225554),
      surfaceBright: Color(4282922039),
      surfaceContainerLowest: Color(4279831052),
      surfaceContainerLow: Color(4280817434),
      surfaceContainer: Color(4281080606),
      surfaceContainerHigh: Color(4281804072),
      surfaceContainerHighest: Color(4282593330),
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
