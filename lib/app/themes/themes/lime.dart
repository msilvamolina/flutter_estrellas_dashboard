import "package:flutter/material.dart";

import "../util.dart";

class LimeMaterialTheme {
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4284179200),
      surfaceTint: Color(4284179200),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4292141888),
      onPrimaryContainer: Color(4282402304),
      secondary: Color(4284310055),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4293192352),
      onSecondaryContainer: Color(4282862867),
      tertiary: Color(4284179200),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4292141888),
      onTertiaryContainer: Color(4282402304),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294769384),
      onSurface: Color(4279966738),
      onSurfaceVariant: Color(4282861621),
      outline: Color(4286085475),
      outlineVariant: Color(4291348655),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413926),
      inversePrimary: Color(4290891820),
      primaryFixed: Color(4292734281),
      onPrimaryFixed: Color(4279901440),
      primaryFixedDim: Color(4290891820),
      onPrimaryFixedVariant: Color(4282665728),
      secondaryFixed: Color(4293060766),
      onSecondaryFixed: Color(4279901440),
      secondaryFixedDim: Color(4291153028),
      onSecondaryFixedVariant: Color(4282731024),
      tertiaryFixed: Color(4292734281),
      onTertiaryFixed: Color(4279901440),
      tertiaryFixedDim: Color(4290891820),
      onTertiaryFixedVariant: Color(4282665728),
      surfaceDim: Color(4292664266),
      surfaceBright: Color(4294769384),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374627),
      surfaceContainer: Color(4293980125),
      surfaceContainerHigh: Color(4293585368),
      surfaceContainerHighest: Color(4293256146),
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
      primary: Color(4282468096),
      surfaceTint: Color(4284179200),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285627136),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282467852),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285757754),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282468096),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285627136),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294769384),
      onSurface: Color(4279966738),
      onSurfaceVariant: Color(4282598449),
      outline: Color(4284440908),
      outlineVariant: Color(4286282854),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413926),
      inversePrimary: Color(4290891820),
      primaryFixed: Color(4285627136),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4284047616),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285757754),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284112932),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285627136),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4284047616),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292664266),
      surfaceBright: Color(4294769384),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374627),
      surfaceContainer: Color(4293980125),
      surfaceContainerHigh: Color(4293585368),
      surfaceContainerHighest: Color(4293256146),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4280361984),
      surfaceTint: Color(4284179200),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4282468096),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280361984),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282467852),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280361984),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4282468096),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294769384),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280558868),
      outline: Color(4282598449),
      outlineVariant: Color(4282598449),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413926),
      inversePrimary: Color(4293391954),
      primaryFixed: Color(4282468096),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281020160),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282467852),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281020160),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4282468096),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281020160),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292664266),
      surfaceBright: Color(4294769384),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294374627),
      surfaceContainer: Color(4293980125),
      surfaceContainerHigh: Color(4293585368),
      surfaceContainerHighest: Color(4293256146),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294442917),
      surfaceTint: Color(4290891820),
      onPrimary: Color(4281283328),
      primaryContainer: Color(4291418164),
      onPrimaryContainer: Color(4281941504),
      secondary: Color(4291153028),
      onSecondary: Color(4281283328),
      secondaryContainer: Color(4282270473),
      onSecondaryContainer: Color(4292139665),
      tertiary: Color(4294442917),
      onTertiary: Color(4281283328),
      tertiaryContainer: Color(4291418164),
      onTertiaryContainer: Color(4281941504),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279440394),
      onSurface: Color(4293256146),
      onSurfaceVariant: Color(4291348655),
      outline: Color(4287730299),
      outlineVariant: Color(4282861621),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293256146),
      inversePrimary: Color(4284179200),
      primaryFixed: Color(4292734281),
      onPrimaryFixed: Color(4279901440),
      primaryFixedDim: Color(4290891820),
      onPrimaryFixedVariant: Color(4282665728),
      secondaryFixed: Color(4293060766),
      onSecondaryFixed: Color(4279901440),
      secondaryFixedDim: Color(4291153028),
      onSecondaryFixedVariant: Color(4282731024),
      tertiaryFixed: Color(4292734281),
      onTertiaryFixed: Color(4279901440),
      tertiaryFixedDim: Color(4290891820),
      onTertiaryFixedVariant: Color(4282665728),
      surfaceDim: Color(4279440394),
      surfaceBright: Color(4281940526),
      surfaceContainerLowest: Color(4279111430),
      surfaceContainerLow: Color(4279966738),
      surfaceContainer: Color(4280295446),
      surfaceContainerHigh: Color(4280953632),
      surfaceContainerHighest: Color(4281677354),
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
      primary: Color(4294442917),
      surfaceTint: Color(4290891820),
      onPrimary: Color(4281283328),
      primaryContainer: Color(4291418164),
      onPrimaryContainer: Color(4279769856),
      secondary: Color(4291481736),
      onSecondary: Color(4279572480),
      secondaryContainer: Color(4287599956),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294442917),
      onTertiary: Color(4281283328),
      tertiaryContainer: Color(4291418164),
      onTertiaryContainer: Color(4279769856),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279440394),
      onSurface: Color(4294835178),
      onSurfaceVariant: Color(4291611827),
      outline: Color(4288980108),
      outlineVariant: Color(4286874990),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293256146),
      inversePrimary: Color(4282797056),
      primaryFixed: Color(4292734281),
      onPrimaryFixed: Color(4279243520),
      primaryFixedDim: Color(4290891820),
      onPrimaryFixedVariant: Color(4281612544),
      secondaryFixed: Color(4293060766),
      onSecondaryFixed: Color(4279243520),
      secondaryFixedDim: Color(4291153028),
      onSecondaryFixedVariant: Color(4281612545),
      tertiaryFixed: Color(4292734281),
      onTertiaryFixed: Color(4279243520),
      tertiaryFixedDim: Color(4290891820),
      onTertiaryFixedVariant: Color(4281612544),
      surfaceDim: Color(4279440394),
      surfaceBright: Color(4281940526),
      surfaceContainerLowest: Color(4279111430),
      surfaceContainerLow: Color(4279966738),
      surfaceContainer: Color(4280295446),
      surfaceContainerHigh: Color(4280953632),
      surfaceContainerHighest: Color(4281677354),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294705094),
      surfaceTint: Color(4290891820),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4291418164),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294705094),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4291481736),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294705094),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4291418164),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279440394),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294835425),
      outline: Color(4291611827),
      outlineVariant: Color(4291611827),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293256146),
      inversePrimary: Color(4280823040),
      primaryFixed: Color(4293062989),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4291220529),
      onPrimaryFixedVariant: Color(4279572480),
      secondaryFixed: Color(4293323938),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4291481736),
      onSecondaryFixedVariant: Color(4279572480),
      tertiaryFixed: Color(4293062989),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4291220529),
      onTertiaryFixedVariant: Color(4279572480),
      surfaceDim: Color(4279440394),
      surfaceBright: Color(4281940526),
      surfaceContainerLowest: Color(4279111430),
      surfaceContainerLow: Color(4279966738),
      surfaceContainer: Color(4280295446),
      surfaceContainerHigh: Color(4280953632),
      surfaceContainerHighest: Color(4281677354),
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
