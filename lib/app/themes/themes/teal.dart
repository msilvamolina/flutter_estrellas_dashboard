import "package:flutter/material.dart";

import "../util.dart";

class TealMaterialTheme {
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278213458),
      surfaceTint: Color(4278217312),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278223735),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282279263),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291030501),
      onSecondaryContainer: Color(4280832074),
      tertiary: Color(4278213458),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278223735),
      onTertiaryContainer: Color(4294967295),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294310648),
      onSurface: Color(4279704859),
      onSurfaceVariant: Color(4282206535),
      outline: Color(4285364855),
      outlineVariant: Color(4290562502),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086512),
      inversePrimary: Color(4284996041),
      primaryFixed: Color(4286969573),
      onPrimaryFixed: Color(4278198300),
      primaryFixedDim: Color(4284996041),
      onPrimaryFixedVariant: Color(4278210632),
      secondaryFixed: Color(4290898915),
      onSecondaryFixed: Color(4278198300),
      secondaryFixedDim: Color(4289056711),
      onSecondaryFixedVariant: Color(4280700232),
      tertiaryFixed: Color(4286969573),
      onTertiaryFixed: Color(4278198300),
      tertiaryFixedDim: Color(4284996041),
      onTertiaryFixedVariant: Color(4278210632),
      surfaceDim: Color(4292271065),
      surfaceBright: Color(4294310648),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916146),
      surfaceContainer: Color(4293586925),
      surfaceContainerHigh: Color(4293192167),
      surfaceContainerHighest: Color(4292797665),
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
      primary: Color(4278209604),
      surfaceTint: Color(4278217312),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278223735),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280437060),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283726965),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278209604),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278223735),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294310648),
      onSurface: Color(4279704859),
      onSurfaceVariant: Color(4281943363),
      outline: Color(4283785823),
      outlineVariant: Color(4285627770),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086512),
      inversePrimary: Color(4284996041),
      primaryFixed: Color(4278223735),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278216798),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4283726965),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282147677),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278223735),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278216798),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292271065),
      surfaceBright: Color(4294310648),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916146),
      surfaceContainer: Color(4293586925),
      surfaceContainerHigh: Color(4293192167),
      surfaceContainerHighest: Color(4292797665),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278200355),
      surfaceTint: Color(4278217312),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278209604),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278200355),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4280437060),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278200355),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278209604),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294310648),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4279903780),
      outline: Color(4281943363),
      outlineVariant: Color(4281943363),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281086512),
      inversePrimary: Color(4287823854),
      primaryFixed: Color(4278209604),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278203182),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4280437060),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278596398),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278209604),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278203182),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292271065),
      surfaceBright: Color(4294310648),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916146),
      surfaceContainer: Color(4293586925),
      surfaceContainerHigh: Color(4293192167),
      surfaceContainerHighest: Color(4292797665),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4284996041),
      surfaceTint: Color(4284996041),
      onPrimary: Color(4278204209),
      primaryContainer: Color(4278223735),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4289056711),
      onSecondary: Color(4278990641),
      secondaryContainer: Color(4280174144),
      onSecondaryContainer: Color(4289977813),
      tertiary: Color(4284996041),
      onTertiary: Color(4278204209),
      tertiaryContainer: Color(4278223735),
      onTertiaryContainer: Color(4294967295),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279178259),
      onSurface: Color(4292797665),
      onSurfaceVariant: Color(4290562502),
      outline: Color(4287009680),
      outlineVariant: Color(4282206535),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797665),
      inversePrimary: Color(4278217312),
      primaryFixed: Color(4286969573),
      onPrimaryFixed: Color(4278198300),
      primaryFixedDim: Color(4284996041),
      onPrimaryFixedVariant: Color(4278210632),
      secondaryFixed: Color(4290898915),
      onSecondaryFixed: Color(4278198300),
      secondaryFixedDim: Color(4289056711),
      onSecondaryFixedVariant: Color(4280700232),
      tertiaryFixed: Color(4286969573),
      onTertiaryFixed: Color(4278198300),
      tertiaryFixedDim: Color(4284996041),
      onTertiaryFixedVariant: Color(4278210632),
      surfaceDim: Color(4279178259),
      surfaceBright: Color(4281678393),
      surfaceContainerLowest: Color(4278849294),
      surfaceContainerLow: Color(4279704859),
      surfaceContainer: Color(4279968031),
      surfaceContainerHigh: Color(4280625962),
      surfaceContainerHighest: Color(4281349685),
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
      primary: Color(4285324749),
      surfaceTint: Color(4284996041),
      onPrimary: Color(4278196759),
      primaryContainer: Color(4280394387),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4289319883),
      onSecondary: Color(4278196759),
      secondaryContainer: Color(4285569169),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4285324749),
      onTertiary: Color(4278196759),
      tertiaryContainer: Color(4280394387),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279178259),
      onSurface: Color(4294442233),
      onSurfaceVariant: Color(4290825930),
      outline: Color(4288194210),
      outlineVariant: Color(4286154371),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797665),
      inversePrimary: Color(4278211145),
      primaryFixed: Color(4286969573),
      onPrimaryFixed: Color(4278195474),
      primaryFixedDim: Color(4284996041),
      onPrimaryFixedVariant: Color(4278206007),
      secondaryFixed: Color(4290898915),
      onSecondaryFixed: Color(4278195474),
      secondaryFixedDim: Color(4289056711),
      onSecondaryFixedVariant: Color(4279450679),
      tertiaryFixed: Color(4286969573),
      onTertiaryFixed: Color(4278195474),
      tertiaryFixedDim: Color(4284996041),
      onTertiaryFixedVariant: Color(4278206007),
      surfaceDim: Color(4279178259),
      surfaceBright: Color(4281678393),
      surfaceContainerLowest: Color(4278849294),
      surfaceContainerLow: Color(4279704859),
      surfaceContainer: Color(4279968031),
      surfaceContainerHigh: Color(4280625962),
      surfaceContainerHighest: Color(4281349685),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4293656570),
      surfaceTint: Color(4284996041),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4285324749),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293656570),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4289319883),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293656570),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4285324749),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279178259),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4293983994),
      outline: Color(4290825930),
      outlineVariant: Color(4290825930),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797665),
      inversePrimary: Color(4278202411),
      primaryFixed: Color(4287298281),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4285324749),
      onPrimaryFixedVariant: Color(4278196759),
      secondaryFixed: Color(4291162087),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4289319883),
      onSecondaryFixedVariant: Color(4278196759),
      tertiaryFixed: Color(4287298281),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4285324749),
      onTertiaryFixedVariant: Color(4278196759),
      surfaceDim: Color(4279178259),
      surfaceBright: Color(4281678393),
      surfaceContainerLowest: Color(4278849294),
      surfaceContainerLow: Color(4279704859),
      surfaceContainer: Color(4279968031),
      surfaceContainerHigh: Color(4280625962),
      surfaceContainerHighest: Color(4281349685),
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
