import "package:flutter/material.dart";

import "../util.dart";

class BlackMaterialTheme {
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4279111182),
      surfaceTint: Color(4284440158),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281216558),
      onPrimaryContainer: Color(4290624442),
      secondary: Color(4284440158),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4293519077),
      onSecondaryContainer: Color(4283124298),
      tertiary: Color(4278190080),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280690214),
      onTertiaryContainer: Color(4289835441),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294834424),
      onSurface: Color(4280032027),
      onSurfaceVariant: Color(4282664776),
      outline: Color(4285823096),
      outlineVariant: Color(4291086279),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413680),
      inversePrimary: Color(4291348165),
      primaryFixed: Color(4293255905),
      onPrimaryFixed: Color(4279966748),
      primaryFixedDim: Color(4291348165),
      onPrimaryFixedVariant: Color(4282861382),
      secondaryFixed: Color(4293255905),
      onSecondaryFixed: Color(4280032027),
      secondaryFixedDim: Color(4291413701),
      onSecondaryFixedVariant: Color(4282861126),
      tertiaryFixed: Color(4293059298),
      onTertiaryFixed: Color(4279966491),
      tertiaryFixedDim: Color(4291217094),
      onTertiaryFixedVariant: Color(4282861383),
      surfaceDim: Color(4292729304),
      surfaceBright: Color(4294834424),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294439922),
      surfaceContainer: Color(4294045164),
      surfaceContainerHigh: Color(4293650407),
      surfaceContainerHighest: Color(4293255905),
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
      primary: Color(4279111182),
      surfaceTint: Color(4284440158),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281216558),
      onPrimaryContainer: Color(4293650663),
      secondary: Color(4282598210),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285953140),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278190080),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280690214),
      onTertiaryContainer: Color(4292664540),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294834424),
      onSurface: Color(4280032027),
      onSurfaceVariant: Color(4282401604),
      outline: Color(4284244064),
      outlineVariant: Color(4286086012),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413680),
      inversePrimary: Color(4291348165),
      primaryFixed: Color(4285887604),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4284243036),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285953140),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284308571),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285822068),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4284243036),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292729304),
      surfaceBright: Color(4294834424),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294439922),
      surfaceContainer: Color(4294045164),
      surfaceContainerHigh: Color(4293650407),
      surfaceContainerHighest: Color(4293255905),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4279111182),
      surfaceTint: Color(4284440158),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281216558),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280427042),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282598210),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278190080),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280690214),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294834424),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280362021),
      outline: Color(4282401604),
      outlineVariant: Color(4282401604),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413680),
      inversePrimary: Color(4293848043),
      primaryFixed: Color(4282598211),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281150765),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282598210),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281150508),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4282598211),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281150765),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292729304),
      surfaceBright: Color(4294834424),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294439922),
      surfaceContainer: Color(4294045164),
      surfaceContainerHigh: Color(4293650407),
      surfaceContainerHighest: Color(4293255905),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4291348165),
      surfaceTint: Color(4291348165),
      onPrimary: Color(4281348144),
      primaryContainer: Color(4279834905),
      onPrimaryContainer: Color(4289111204),
      secondary: Color(4291413701),
      onSecondary: Color(4281413680),
      secondaryContainer: Color(4282268989),
      onSecondaryContainer: Color(4292071631),
      tertiary: Color(4291217094),
      onTertiary: Color(4281348144),
      tertiaryContainer: Color(4278190080),
      onTertiaryContainer: Color(4288059030),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279505683),
      onSurface: Color(4293255905),
      onSurfaceVariant: Color(4291086279),
      outline: Color(4287533458),
      outlineVariant: Color(4282664776),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255905),
      inversePrimary: Color(4284440158),
      primaryFixed: Color(4293255905),
      onPrimaryFixed: Color(4279966748),
      primaryFixedDim: Color(4291348165),
      onPrimaryFixedVariant: Color(4282861382),
      secondaryFixed: Color(4293255905),
      onSecondaryFixed: Color(4280032027),
      secondaryFixedDim: Color(4291413701),
      onSecondaryFixedVariant: Color(4282861126),
      tertiaryFixed: Color(4293059298),
      onTertiaryFixed: Color(4279966491),
      tertiaryFixedDim: Color(4291217094),
      onTertiaryFixedVariant: Color(4282861383),
      surfaceDim: Color(4279505683),
      surfaceBright: Color(4282005817),
      surfaceContainerLowest: Color(4279111182),
      surfaceContainerLow: Color(4280032027),
      surfaceContainer: Color(4280295199),
      surfaceContainerHigh: Color(4281018922),
      surfaceContainerHighest: Color(4281676852),
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
      primary: Color(4291611338),
      surfaceTint: Color(4291348165),
      onPrimary: Color(4279637526),
      primaryContainer: Color(4287795344),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4291676873),
      onSecondary: Color(4279637526),
      secondaryContainer: Color(4287795344),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4291546059),
      onTertiary: Color(4279637526),
      tertiaryContainer: Color(4287730065),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279505683),
      onSurface: Color(4294900473),
      onSurfaceVariant: Color(4291349452),
      outline: Color(4288717732),
      outlineVariant: Color(4286612612),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255905),
      inversePrimary: Color(4282927176),
      primaryFixed: Color(4293255905),
      onPrimaryFixed: Color(4279308561),
      primaryFixedDim: Color(4291348165),
      onPrimaryFixedVariant: Color(4281742902),
      secondaryFixed: Color(4293255905),
      onSecondaryFixed: Color(4279308561),
      secondaryFixedDim: Color(4291413701),
      onSecondaryFixedVariant: Color(4281808438),
      tertiaryFixed: Color(4293059298),
      onTertiaryFixed: Color(4279308561),
      tertiaryFixedDim: Color(4291217094),
      onTertiaryFixedVariant: Color(4281742902),
      surfaceDim: Color(4279505683),
      surfaceBright: Color(4282005817),
      surfaceContainerLowest: Color(4279111182),
      surfaceContainerLow: Color(4280032027),
      surfaceContainer: Color(4280295199),
      surfaceContainerHigh: Color(4281018922),
      surfaceContainerHighest: Color(4281676852),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294834937),
      surfaceTint: Color(4291348165),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4291611338),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294900473),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4291676873),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294704123),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4291546059),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279505683),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294573051),
      outline: Color(4291349452),
      outlineVariant: Color(4291349452),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255905),
      inversePrimary: Color(4280953386),
      primaryFixed: Color(4293519078),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4291611338),
      onPrimaryFixedVariant: Color(4279637526),
      secondaryFixed: Color(4293519077),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4291676873),
      onSecondaryFixedVariant: Color(4279637526),
      tertiaryFixed: Color(4293388263),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4291546059),
      onTertiaryFixedVariant: Color(4279637526),
      surfaceDim: Color(4279505683),
      surfaceBright: Color(4282005817),
      surfaceContainerLowest: Color(4279111182),
      surfaceContainerLow: Color(4280032027),
      surfaceContainer: Color(4280295199),
      surfaceContainerHigh: Color(4281018922),
      surfaceContainerHighest: Color(4281676852),
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
