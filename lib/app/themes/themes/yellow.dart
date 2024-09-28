import "package:flutter/material.dart";

import "../util.dart";

class YellowMaterialTheme {
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4285095680),
      surfaceTint: Color(4285095680),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294962792),
      onPrimaryContainer: Color(4283846144),
      secondary: Color(4284964641),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294043032),
      onSecondaryContainer: Color(4283451659),
      tertiary: Color(4286142720),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294953033),
      onTertiaryContainer: Color(4283382016),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294965736),
      onSurface: Color(4280097809),
      onSurfaceVariant: Color(4283057971),
      outline: Color(4286347104),
      outlineVariant: Color(4291676076),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281544997),
      inversePrimary: Color(4292593930),
      primaryFixed: Color(4294567220),
      onPrimaryFixed: Color(4280294400),
      primaryFixedDim: Color(4292593930),
      onPrimaryFixedVariant: Color(4283385856),
      secondaryFixed: Color(4293977239),
      onSecondaryFixed: Color(4280294400),
      secondaryFixedDim: Color(4292069502),
      onSecondaryFixedVariant: Color(4283320329),
      tertiaryFixed: Color(4294959008),
      onTertiaryFixed: Color(4280687104),
      tertiaryFixedDim: Color(4294491434),
      onTertiaryFixedVariant: Color(4284236544),
      surfaceDim: Color(4292860616),
      surfaceBright: Color(4294965736),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294570977),
      surfaceContainer: Color(4294176476),
      surfaceContainerHigh: Color(4293847254),
      surfaceContainerHighest: Color(4293452497),
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
      primary: Color(4283122688),
      surfaceTint: Color(4285095680),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4286674432),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4283057157),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4286477877),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4283907840),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4287983104),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965736),
      onSurface: Color(4280097809),
      onSurfaceVariant: Color(4282794799),
      outline: Color(4284702538),
      outlineVariant: Color(4286544740),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281544997),
      inversePrimary: Color(4292593930),
      primaryFixed: Color(4286674432),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4284898560),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4286477877),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284833054),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4287983104),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4285945600),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292860616),
      surfaceBright: Color(4294965736),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294570977),
      surfaceContainer: Color(4294176476),
      surfaceContainerHigh: Color(4293847254),
      surfaceContainerHighest: Color(4293452497),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4280754944),
      surfaceTint: Color(4285095680),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283122688),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280754944),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283057157),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281212928),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283907840),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965736),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280755219),
      outline: Color(4282794799),
      outlineVariant: Color(4282794799),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281544997),
      inversePrimary: Color(4294962797),
      primaryFixed: Color(4283122688),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281478400),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4283057157),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281478400),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283907840),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282067456),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292860616),
      surfaceBright: Color(4294965736),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294570977),
      surfaceContainer: Color(4294176476),
      surfaceContainerHigh: Color(4293847254),
      surfaceContainerHighest: Color(4293452497),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294967295),
      surfaceTint: Color(4292593930),
      onPrimary: Color(4281741568),
      primaryContainer: Color(4293580579),
      onPrimaryContainer: Color(4282859520),
      secondary: Color(4292069502),
      onSecondary: Color(4281741568),
      secondaryContainer: Color(4282662400),
      onSecondaryContainer: Color(4292727431),
      tertiary: Color(4294962380),
      onTertiary: Color(4282395904),
      tertiaryContainer: Color(4294294311),
      onTertiaryContainer: Color(4282724608),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279571465),
      onSurface: Color(4293452497),
      onSurfaceVariant: Color(4291676076),
      outline: Color(4288057721),
      outlineVariant: Color(4283057971),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293452497),
      inversePrimary: Color(4285095680),
      primaryFixed: Color(4294567220),
      onPrimaryFixed: Color(4280294400),
      primaryFixedDim: Color(4292593930),
      onPrimaryFixedVariant: Color(4283385856),
      secondaryFixed: Color(4293977239),
      onSecondaryFixed: Color(4280294400),
      secondaryFixedDim: Color(4292069502),
      onSecondaryFixedVariant: Color(4283320329),
      tertiaryFixed: Color(4294959008),
      onTertiaryFixed: Color(4280687104),
      tertiaryFixedDim: Color(4294491434),
      onTertiaryFixedVariant: Color(4284236544),
      surfaceDim: Color(4279571465),
      surfaceBright: Color(4282136877),
      surfaceContainerLowest: Color(4279242245),
      surfaceContainerLow: Color(4280097809),
      surfaceContainer: Color(4280426517),
      surfaceContainerHigh: Color(4281084447),
      surfaceContainerHighest: Color(4281808169),
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
      primary: Color(4294967295),
      surfaceTint: Color(4292593930),
      onPrimary: Color(4281741568),
      primaryContainer: Color(4293580579),
      onPrimaryContainer: Color(4280557568),
      secondary: Color(4292332674),
      onSecondary: Color(4279899904),
      secondaryContainer: Color(4288385614),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294962380),
      onTertiary: Color(4282395904),
      tertiaryContainer: Color(4294294311),
      onTertiaryContainer: Color(4279503872),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279571465),
      onSurface: Color(4294966002),
      onSurfaceVariant: Color(4291939248),
      outline: Color(4289241994),
      outlineVariant: Color(4287136620),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293452497),
      inversePrimary: Color(4283451648),
      primaryFixed: Color(4294567220),
      onPrimaryFixed: Color(4279505152),
      primaryFixedDim: Color(4292593930),
      onPrimaryFixedVariant: Color(4282201856),
      secondaryFixed: Color(4293977239),
      onSecondaryFixed: Color(4279505152),
      secondaryFixedDim: Color(4292069502),
      onSecondaryFixedVariant: Color(4282201856),
      tertiaryFixed: Color(4294959008),
      onTertiaryFixed: Color(4279832576),
      tertiaryFixedDim: Color(4294491434),
      onTertiaryFixedVariant: Color(4282856192),
      surfaceDim: Color(4279571465),
      surfaceBright: Color(4282136877),
      surfaceContainerLowest: Color(4279242245),
      surfaceContainerLow: Color(4280097809),
      surfaceContainer: Color(4280426517),
      surfaceContainerHigh: Color(4281084447),
      surfaceContainerHighest: Color(4281808169),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294967295),
      surfaceTint: Color(4292593930),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4293580579),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294966002),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4292332674),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294966007),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294820399),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279571465),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294966002),
      outline: Color(4291939248),
      outlineVariant: Color(4291939248),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293452497),
      inversePrimary: Color(4281281280),
      primaryFixed: Color(4294830393),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4292922644),
      onPrimaryFixedVariant: Color(4279899904),
      secondaryFixed: Color(4294240667),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4292332674),
      onSecondaryFixedVariant: Color(4279899904),
      tertiaryFixed: Color(4294960304),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294820399),
      onTertiaryFixedVariant: Color(4280227072),
      surfaceDim: Color(4279571465),
      surfaceBright: Color(4282136877),
      surfaceContainerLowest: Color(4279242245),
      surfaceContainerLow: Color(4280097809),
      surfaceContainer: Color(4280426517),
      surfaceContainerHigh: Color(4281084447),
      surfaceContainerHighest: Color(4281808169),
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
