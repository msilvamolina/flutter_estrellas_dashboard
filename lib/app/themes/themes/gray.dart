import "package:flutter/material.dart";

import "../util.dart";

class GrayMaterialTheme {
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4284374623),
      surfaceTint: Color(4284374623),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4289309097),
      onPrimaryContainer: Color(4280164127),
      secondary: Color(4284440158),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4293453541),
      onSecondaryContainer: Color(4283058762),
      tertiary: Color(4284570975),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4289570986),
      onTertiaryContainer: Color(4280294944),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294768888),
      onSurface: Color(4280032027),
      onSurfaceVariant: Color(4282664776),
      outline: Color(4285823096),
      outlineVariant: Color(4291086279),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413680),
      inversePrimary: Color(4291282630),
      primaryFixed: Color(4293124834),
      onPrimaryFixed: Color(4279901212),
      primaryFixedDim: Color(4291282630),
      onPrimaryFixedVariant: Color(4282795847),
      secondaryFixed: Color(4293190369),
      onSecondaryFixed: Color(4279966748),
      secondaryFixedDim: Color(4291348166),
      onSecondaryFixedVariant: Color(4282861383),
      tertiaryFixed: Color(4293386723),
      onTertiaryFixed: Color(4280097565),
      tertiaryFixedDim: Color(4291544519),
      onTertiaryFixedVariant: Color(4282992200),
      surfaceDim: Color(4292729305),
      surfaceBright: Color(4294768888),
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
      primary: Color(4282532675),
      surfaceTint: Color(4284374623),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285822069),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282598211),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285887604),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282729028),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4286083957),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294768888),
      onSurface: Color(4280032027),
      onSurfaceVariant: Color(4282401604),
      outline: Color(4284244064),
      outlineVariant: Color(4286086012),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413680),
      inversePrimary: Color(4291282630),
      primaryFixed: Color(4285822069),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4284177500),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285887604),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284243036),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4286083957),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4284439389),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292729305),
      surfaceBright: Color(4294768888),
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
      primary: Color(4280361507),
      surfaceTint: Color(4284374623),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4282532675),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280427042),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282598211),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280557859),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4282729028),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294768888),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280362277),
      outline: Color(4282401604),
      outlineVariant: Color(4282401604),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281413680),
      inversePrimary: Color(4293782764),
      primaryFixed: Color(4282532675),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4281085229),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282598211),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281150765),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4282729028),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281281582),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292729305),
      surfaceBright: Color(4294768888),
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
      primary: Color(4291282630),
      surfaceTint: Color(4291282630),
      onPrimary: Color(4281282865),
      primaryContainer: Color(4288059030),
      onPrimaryContainer: Color(4278255873),
      secondary: Color(4291348166),
      onSecondary: Color(4281348144),
      secondaryContainer: Color(4282203453),
      onSecondaryContainer: Color(4292071632),
      tertiary: Color(4291544519),
      onTertiary: Color(4281479217),
      tertiaryContainer: Color(4288320919),
      onTertiaryContainer: Color(4278321410),
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
      inversePrimary: Color(4284374623),
      primaryFixed: Color(4293124834),
      onPrimaryFixed: Color(4279901212),
      primaryFixedDim: Color(4291282630),
      onPrimaryFixedVariant: Color(4282795847),
      secondaryFixed: Color(4293190369),
      onSecondaryFixed: Color(4279966748),
      secondaryFixedDim: Color(4291348166),
      onSecondaryFixedVariant: Color(4282861383),
      tertiaryFixed: Color(4293386723),
      onTertiaryFixed: Color(4280097565),
      tertiaryFixedDim: Color(4291544519),
      onTertiaryFixedVariant: Color(4282992200),
      surfaceDim: Color(4279505683),
      surfaceBright: Color(4282005817),
      surfaceContainerLowest: Color(4279111182),
      surfaceContainerLow: Color(4280032027),
      surfaceContainer: Color(4280295199),
      surfaceContainerHigh: Color(4280953386),
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
      primary: Color(4291545802),
      surfaceTint: Color(4291282630),
      onPrimary: Color(4279571991),
      primaryContainer: Color(4288059030),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4291611338),
      onSecondary: Color(4279637526),
      secondaryContainer: Color(4287795344),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4291807691),
      onTertiary: Color(4279768599),
      tertiaryContainer: Color(4288320919),
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
      inversePrimary: Color(4282861640),
      primaryFixed: Color(4293124834),
      onPrimaryFixed: Color(4279243026),
      primaryFixedDim: Color(4291282630),
      onPrimaryFixedVariant: Color(4281677366),
      secondaryFixed: Color(4293190369),
      onSecondaryFixed: Color(4279308561),
      secondaryFixedDim: Color(4291348166),
      onSecondaryFixedVariant: Color(4281742902),
      tertiaryFixed: Color(4293386723),
      onTertiaryFixed: Color(4279439634),
      tertiaryFixedDim: Color(4291544519),
      onTertiaryFixedVariant: Color(4281873719),
      surfaceDim: Color(4279505683),
      surfaceBright: Color(4282005817),
      surfaceContainerLowest: Color(4279111182),
      surfaceContainerLow: Color(4280032027),
      surfaceContainer: Color(4280295199),
      surfaceContainerHigh: Color(4280953386),
      surfaceContainerHighest: Color(4281676852),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294769402),
      surfaceTint: Color(4291282630),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4291545802),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294834937),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4291611338),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965754),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4291807691),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279505683),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294573052),
      outline: Color(4291349452),
      outlineVariant: Color(4291349452),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293255905),
      inversePrimary: Color(4280887850),
      primaryFixed: Color(4293388006),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4291545802),
      onPrimaryFixedVariant: Color(4279571991),
      secondaryFixed: Color(4293519078),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4291611338),
      onSecondaryFixedVariant: Color(4279637526),
      tertiaryFixed: Color(4293715431),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4291807691),
      onTertiaryFixedVariant: Color(4279768599),
      surfaceDim: Color(4279505683),
      surfaceBright: Color(4282005817),
      surfaceContainerLowest: Color(4279111182),
      surfaceContainerLow: Color(4280032027),
      surfaceContainer: Color(4280295199),
      surfaceContainerHigh: Color(4280953386),
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
