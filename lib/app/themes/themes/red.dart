import "package:flutter/material.dart";

import "../util.dart";

class RedMaterialTheme {
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4289003527),
      surfaceTint: Color(4290450964),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4292620584),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4288822578),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294939011),
      onSecondaryContainer: Color(4283564290),
      tertiary: Color(4289003527),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4292620584),
      onTertiaryContainer: Color(4294967295),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294965495),
      onSurface: Color(4280817429),
      onSurfaceVariant: Color(4284235836),
      outline: Color(4287655787),
      outlineVariant: Color(4293246392),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4282264617),
      inversePrimary: Color(4294948009),
      primaryFixed: Color(4294957781),
      onPrimaryFixed: Color(4282449921),
      primaryFixedDim: Color(4294948009),
      onPrimaryFixedVariant: Color(4287823877),
      secondaryFixed: Color(4294957781),
      onSecondaryFixed: Color(4282449921),
      secondaryFixedDim: Color(4294948009),
      onSecondaryFixedVariant: Color(4286784797),
      tertiaryFixed: Color(4294957781),
      onTertiaryFixed: Color(4282449921),
      tertiaryFixedDim: Color(4294948009),
      onTertiaryFixedVariant: Color(4287823877),
      surfaceDim: Color(4294104015),
      surfaceBright: Color(4294965495),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963438),
      surfaceContainer: Color(4294961638),
      surfaceContainerHigh: Color(4294959837),
      surfaceContainerHighest: Color(4294630615),
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
      primary: Color(4287365125),
      surfaceTint: Color(4290450964),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4292620584),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4286390810),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4290728518),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4287365125),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4292620584),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965495),
      onSurface: Color(4280817429),
      onSurfaceVariant: Color(4283907128),
      outline: Color(4285945939),
      outlineVariant: Color(4287918958),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4282264617),
      inversePrimary: Color(4294948009),
      primaryFixed: Color(4292620584),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4290253585),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4290728518),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4288625200),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4292620584),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4290253585),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4294104015),
      surfaceBright: Color(4294965495),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963438),
      surfaceContainer: Color(4294961638),
      surfaceContainerHigh: Color(4294959837),
      surfaceContainerHighest: Color(4294630615),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4283301889),
      surfaceTint: Color(4290450964),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4287365125),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4283301889),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4286390810),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4283301889),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4287365125),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965495),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4281671195),
      outline: Color(4283907128),
      outlineVariant: Color(4283907128),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4282264617),
      inversePrimary: Color(4294961123),
      primaryFixed: Color(4287365125),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4284612610),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4286390810),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284352775),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4287365125),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4284612610),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4294104015),
      surfaceBright: Color(4294965495),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963438),
      surfaceContainer: Color(4294961638),
      surfaceContainerHigh: Color(4294959837),
      surfaceContainerHighest: Color(4294630615),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294948009),
      surfaceTint: Color(4294948009),
      onPrimary: Color(4285071362),
      primaryContainer: Color(4292620584),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4294948009),
      onSecondary: Color(4284681738),
      secondaryContainer: Color(4285930774),
      onSecondaryContainer: Color(4294952124),
      tertiary: Color(4294948009),
      onTertiary: Color(4285071362),
      tertiaryContainer: Color(4292620584),
      onTertiaryContainer: Color(4294967295),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4280160013),
      onSurface: Color(4294630615),
      onSurfaceVariant: Color(4293246392),
      outline: Color(4289497220),
      outlineVariant: Color(4284235836),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294630615),
      inversePrimary: Color(4290450964),
      primaryFixed: Color(4294957781),
      onPrimaryFixed: Color(4282449921),
      primaryFixedDim: Color(4294948009),
      onPrimaryFixedVariant: Color(4287823877),
      secondaryFixed: Color(4294957781),
      onSecondaryFixed: Color(4282449921),
      secondaryFixedDim: Color(4294948009),
      onSecondaryFixedVariant: Color(4286784797),
      tertiaryFixed: Color(4294957781),
      onTertiaryFixed: Color(4282449921),
      tertiaryFixedDim: Color(4294948009),
      onTertiaryFixedVariant: Color(4287823877),
      surfaceDim: Color(4280160013),
      surfaceBright: Color(4282922034),
      surfaceContainerLowest: Color(4279831048),
      surfaceContainerLow: Color(4280817429),
      surfaceContainer: Color(4281080601),
      surfaceContainerHigh: Color(4281804323),
      surfaceContainerHighest: Color(4282593325),
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
      primary: Color(4294949552),
      surfaceTint: Color(4294948009),
      onPrimary: Color(4281794561),
      primaryContainer: Color(4294923589),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294949552),
      onSecondary: Color(4281794561),
      secondaryContainer: Color(4293094751),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294949552),
      onTertiary: Color(4281794561),
      tertiaryContainer: Color(4294923589),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4280160013),
      onSurface: Color(4294965752),
      onSurfaceVariant: Color(4293509820),
      outline: Color(4290747029),
      outlineVariant: Color(4288510838),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294630615),
      inversePrimary: Color(4287954949),
      primaryFixed: Color(4294957781),
      onPrimaryFixed: Color(4281139200),
      primaryFixedDim: Color(4294948009),
      onPrimaryFixedVariant: Color(4285792259),
      secondaryFixed: Color(4294957781),
      onSecondaryFixed: Color(4281139200),
      secondaryFixedDim: Color(4294948009),
      onSecondaryFixedVariant: Color(4285207567),
      tertiaryFixed: Color(4294957781),
      onTertiaryFixed: Color(4281139200),
      tertiaryFixedDim: Color(4294948009),
      onTertiaryFixedVariant: Color(4285792259),
      surfaceDim: Color(4280160013),
      surfaceBright: Color(4282922034),
      surfaceContainerLowest: Color(4279831048),
      surfaceContainerLow: Color(4280817429),
      surfaceContainer: Color(4281080601),
      surfaceContainerHigh: Color(4281804323),
      surfaceContainerHighest: Color(4282593325),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294965752),
      surfaceTint: Color(4294948009),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294949552),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965752),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4294949552),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965752),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294949552),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4280160013),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294965752),
      outline: Color(4293509820),
      outlineVariant: Color(4293509820),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294630615),
      inversePrimary: Color(4284284930),
      primaryFixed: Color(4294959323),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294949552),
      onPrimaryFixedVariant: Color(4281794561),
      secondaryFixed: Color(4294959323),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4294949552),
      onSecondaryFixedVariant: Color(4281794561),
      tertiaryFixed: Color(4294959323),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294949552),
      onTertiaryFixedVariant: Color(4281794561),
      surfaceDim: Color(4280160013),
      surfaceBright: Color(4282922034),
      surfaceContainerLowest: Color(4279831048),
      surfaceContainerLow: Color(4280817429),
      surfaceContainer: Color(4281080601),
      surfaceContainerHigh: Color(4281804323),
      surfaceContainerHighest: Color(4282593325),
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
