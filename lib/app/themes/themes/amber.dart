import "package:flutter/material.dart";

import "../util.dart";

class AmberMaterialTheme {
  final TextTheme textTheme;

  const AmberMaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4286077184),
      surfaceTint: Color(4286077184),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294953549),
      onPrimaryContainer: Color(4283447808),
      secondary: Color(4285815583),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294959266),
      onSecondaryContainer: Color(4284237065),
      tertiary: Color(4286077184),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294953549),
      onTertiaryContainer: Color(4283447808),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294965490),
      onSurface: Color(4280294161),
      onSurfaceVariant: Color(4283385394),
      outline: Color(4286740064),
      outlineVariant: Color(4292134315),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281741348),
      inversePrimary: Color(4294622464),
      primaryFixed: Color(4294959006),
      onPrimaryFixed: Color(4280687104),
      primaryFixedDim: Color(4294622464),
      onPrimaryFixedVariant: Color(4284171008),
      secondaryFixed: Color(4294959006),
      onSecondaryFixed: Color(4280687104),
      secondaryFixedDim: Color(4293182076),
      onSecondaryFixedVariant: Color(4284105479),
      tertiaryFixed: Color(4294959006),
      onTertiaryFixed: Color(4280687104),
      tertiaryFixedDim: Color(4294622464),
      onTertiaryFixedVariant: Color(4284171008),
      surfaceDim: Color(4293188040),
      surfaceBright: Color(4294965490),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294898401),
      surfaceContainer: Color(4294503643),
      surfaceContainerHigh: Color(4294109142),
      surfaceContainerHighest: Color(4293714384),
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
      primary: Color(4283842304),
      surfaceTint: Color(4286077184),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4287917824),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4283842307),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4287394099),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4283842304),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4287917824),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965490),
      onSurface: Color(4280294161),
      onSurfaceVariant: Color(4283122222),
      outline: Color(4285095497),
      outlineVariant: Color(4286937443),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281741348),
      inversePrimary: Color(4294622464),
      primaryFixed: Color(4287917824),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4285880064),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4287394099),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4285618205),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4287917824),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4285880064),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293188040),
      surfaceBright: Color(4294965490),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294898401),
      surfaceContainer: Color(4294503643),
      surfaceContainerHigh: Color(4294109142),
      surfaceContainerHighest: Color(4293714384),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281212928),
      surfaceTint: Color(4286077184),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283842304),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281212928),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283842307),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281212928),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283842304),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965490),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4281017106),
      outline: Color(4283122222),
      outlineVariant: Color(4283122222),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281741348),
      inversePrimary: Color(4294961859),
      primaryFixed: Color(4283842304),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282067456),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4283842307),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282067456),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283842304),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282067456),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293188040),
      surfaceBright: Color(4294965490),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294898401),
      surfaceContainer: Color(4294503643),
      surfaceContainerHigh: Color(4294109142),
      surfaceContainerHighest: Color(4293714384),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294962897),
      surfaceTint: Color(4294622464),
      onPrimary: Color(4282330624),
      primaryContainer: Color(4294556672),
      onPrimaryContainer: Color(4282790656),
      secondary: Color(4293182076),
      onSecondary: Color(4282330624),
      secondaryContainer: Color(4283579393),
      onSecondaryContainer: Color(4294168969),
      tertiary: Color(4294962897),
      onTertiary: Color(4282330624),
      tertiaryContainer: Color(4294556672),
      onTertiaryContainer: Color(4282790656),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279767817),
      onSurface: Color(4293714384),
      onSurfaceVariant: Color(4292134315),
      outline: Color(4288450424),
      outlineVariant: Color(4283385394),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293714384),
      inversePrimary: Color(4286077184),
      primaryFixed: Color(4294959006),
      onPrimaryFixed: Color(4280687104),
      primaryFixedDim: Color(4294622464),
      onPrimaryFixedVariant: Color(4284171008),
      secondaryFixed: Color(4294959006),
      onSecondaryFixed: Color(4280687104),
      secondaryFixedDim: Color(4293182076),
      onSecondaryFixedVariant: Color(4284105479),
      tertiaryFixed: Color(4294959006),
      onTertiaryFixed: Color(4280687104),
      tertiaryFixedDim: Color(4294622464),
      onTertiaryFixedVariant: Color(4284171008),
      surfaceDim: Color(4279767817),
      surfaceBright: Color(4282333229),
      surfaceContainerLowest: Color(4279373317),
      surfaceContainerLow: Color(4280294161),
      surfaceContainer: Color(4280557332),
      surfaceContainerHigh: Color(4281280798),
      surfaceContainerHighest: Color(4282004520),
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
      primary: Color(4294962897),
      surfaceTint: Color(4294622464),
      onPrimary: Color(4282330624),
      primaryContainer: Color(4294556672),
      onPrimaryContainer: Color(4279701248),
      secondary: Color(4293511040),
      onSecondary: Color(4280227072),
      secondaryContainer: Color(4289432908),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294962897),
      onTertiary: Color(4282330624),
      tertiaryContainer: Color(4294556672),
      onTertiaryContainer: Color(4279701248),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279767817),
      onSurface: Color(4294966007),
      onSurfaceVariant: Color(4292397487),
      outline: Color(4289700233),
      outlineVariant: Color(4287529579),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293714384),
      inversePrimary: Color(4284302336),
      primaryFixed: Color(4294959006),
      onPrimaryFixed: Color(4279832576),
      primaryFixedDim: Color(4294622464),
      onPrimaryFixedVariant: Color(4282856192),
      secondaryFixed: Color(4294959006),
      onSecondaryFixed: Color(4279832576),
      secondaryFixedDim: Color(4293182076),
      onSecondaryFixedVariant: Color(4282856192),
      tertiaryFixed: Color(4294959006),
      onTertiaryFixed: Color(4279832576),
      tertiaryFixedDim: Color(4294622464),
      onTertiaryFixedVariant: Color(4282856192),
      surfaceDim: Color(4279767817),
      surfaceBright: Color(4282333229),
      surfaceContainerLowest: Color(4279373317),
      surfaceContainerLow: Color(4280294161),
      surfaceContainer: Color(4280557332),
      surfaceContainerHigh: Color(4281280798),
      surfaceContainerHighest: Color(4282004520),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294966007),
      surfaceTint: Color(4294622464),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294951176),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294966007),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4293511040),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294966007),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294951176),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279767817),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294966007),
      outline: Color(4292397487),
      outlineVariant: Color(4292397487),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293714384),
      inversePrimary: Color(4281804544),
      primaryFixed: Color(4294960303),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294951176),
      onPrimaryFixedVariant: Color(4280227072),
      secondaryFixed: Color(4294960303),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4293511040),
      onSecondaryFixedVariant: Color(4280227072),
      tertiaryFixed: Color(4294960303),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294951176),
      onTertiaryFixedVariant: Color(4280227072),
      surfaceDim: Color(4279767817),
      surfaceBright: Color(4282333229),
      surfaceContainerLowest: Color(4279373317),
      surfaceContainerLow: Color(4280294161),
      surfaceContainer: Color(4280557332),
      surfaceContainerHigh: Color(4281280798),
      surfaceContainerHighest: Color(4282004520),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
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
