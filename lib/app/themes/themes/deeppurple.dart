import "package:flutter/material.dart";

import "../util.dart";

class DeepPurpleMaterialTheme {
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4283506849),
      surfaceTint: Color(4285481920),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285942727),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4284962439),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292857087),
      onSecondaryContainer: Color(4282857317),
      tertiary: Color(4283506849),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285942727),
      onTertiaryContainer: Color(4294967295),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294899711),
      onSurface: Color(4280097314),
      onSurfaceVariant: Color(4283057235),
      outline: Color(4286280836),
      outlineVariant: Color(4291609557),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281478967),
      inversePrimary: Color(4292066303),
      primaryFixed: Color(4293647871),
      onPrimaryFixed: Color(4280615001),
      primaryFixedDim: Color(4292066303),
      onPrimaryFixedVariant: Color(4283901862),
      secondaryFixed: Color(4293647871),
      onSecondaryFixed: Color(4280422975),
      secondaryFixedDim: Color(4291935733),
      onSecondaryFixedVariant: Color(4283317869),
      tertiaryFixed: Color(4293647871),
      onTertiaryFixed: Color(4280615001),
      tertiaryFixedDim: Color(4292066303),
      onTertiaryFixedVariant: Color(4283901862),
      surfaceDim: Color(4292859875),
      surfaceBright: Color(4294899711),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294570492),
      surfaceContainer: Color(4294175735),
      surfaceContainerHigh: Color(4293781233),
      surfaceContainerHighest: Color(4293386475),
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
      primary: Color(4283506849),
      surfaceTint: Color(4285481920),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285942727),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4283054697),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4286409886),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4283506849),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285942727),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294899711),
      onSurface: Color(4280097314),
      onSurfaceVariant: Color(4282794063),
      outline: Color(4284701803),
      outlineVariant: Color(4286544008),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281478967),
      inversePrimary: Color(4292066303),
      primaryFixed: Color(4286995416),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4285350333),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4286409886),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284765316),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4286995416),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4285350333),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292859875),
      surfaceBright: Color(4294899711),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294570492),
      surfaceContainer: Color(4294175735),
      surfaceContainerHigh: Color(4293781233),
      surfaceContainerHighest: Color(4293386475),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281204842),
      surfaceTint: Color(4285481920),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283638178),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280883526),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283054697),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281204842),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283638178),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294899711),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280689199),
      outline: Color(4282794063),
      outlineVariant: Color(4282794063),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281478967),
      inversePrimary: Color(4294174975),
      primaryFixed: Color(4283638178),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282056836),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4283054697),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281607249),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283638178),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282056836),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292859875),
      surfaceBright: Color(4294899711),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294570492),
      surfaceContainer: Color(4294175735),
      surfaceContainerHigh: Color(4293781233),
      surfaceContainerHighest: Color(4293386475),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4292066303),
      surfaceTint: Color(4292066303),
      onPrimary: Color(4282318989),
      primaryContainer: Color(4284362926),
      onPrimaryContainer: Color(4294109183),
      secondary: Color(4291935733),
      onSecondary: Color(4281804885),
      secondaryContainer: Color(4282659939),
      onSecondaryContainer: Color(4292593663),
      tertiary: Color(4292066303),
      onTertiary: Color(4282318989),
      tertiaryContainer: Color(4284362926),
      onTertiaryContainer: Color(4294109183),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279570970),
      onSurface: Color(4293386475),
      onSurfaceVariant: Color(4291609557),
      outline: Color(4287991454),
      outlineVariant: Color(4283057235),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293386475),
      inversePrimary: Color(4285481920),
      primaryFixed: Color(4293647871),
      onPrimaryFixed: Color(4280615001),
      primaryFixedDim: Color(4292066303),
      onPrimaryFixedVariant: Color(4283901862),
      secondaryFixed: Color(4293647871),
      onSecondaryFixed: Color(4280422975),
      secondaryFixedDim: Color(4291935733),
      onSecondaryFixedVariant: Color(4283317869),
      tertiaryFixed: Color(4293647871),
      onTertiaryFixed: Color(4280615001),
      tertiaryFixedDim: Color(4292066303),
      onTertiaryFixedVariant: Color(4283901862),
      surfaceDim: Color(4279570970),
      surfaceBright: Color(4282071104),
      surfaceContainerLowest: Color(4279242004),
      surfaceContainerLow: Color(4280097314),
      surfaceContainer: Color(4280360486),
      surfaceContainerHigh: Color(4281084209),
      surfaceContainerHighest: Color(4281807676),
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
      primary: Color(4292329727),
      surfaceTint: Color(4292066303),
      onPrimary: Color(4280221772),
      primaryContainer: Color(4288968951),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4292264441),
      onSecondary: Color(4280028217),
      secondaryContainer: Color(4288317628),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4292329727),
      onTertiary: Color(4280221772),
      tertiaryContainer: Color(4288968951),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279570970),
      onSurface: Color(4294965759),
      onSurfaceVariant: Color(4291872729),
      outline: Color(4289241265),
      outlineVariant: Color(4287070352),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293386475),
      inversePrimary: Color(4283967656),
      primaryFixed: Color(4293647871),
      onPrimaryFixed: Color(4279828543),
      primaryFixedDim: Color(4292066303),
      onPrimaryFixedVariant: Color(4282780309),
      secondaryFixed: Color(4293647871),
      onSecondaryFixed: Color(4279698996),
      secondaryFixedDim: Color(4291935733),
      onSecondaryFixedVariant: Color(4282199643),
      tertiaryFixed: Color(4293647871),
      onTertiaryFixed: Color(4279828543),
      tertiaryFixedDim: Color(4292066303),
      onTertiaryFixedVariant: Color(4282780309),
      surfaceDim: Color(4279570970),
      surfaceBright: Color(4282071104),
      surfaceContainerLowest: Color(4279242004),
      surfaceContainerLow: Color(4280097314),
      surfaceContainer: Color(4280360486),
      surfaceContainerHigh: Color(4281084209),
      surfaceContainerHighest: Color(4281807676),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294965759),
      surfaceTint: Color(4292066303),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4292329727),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965759),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4292264441),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965759),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4292329727),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279570970),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294965759),
      outline: Color(4291872729),
      outlineVariant: Color(4291872729),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293386475),
      inversePrimary: Color(4281794685),
      primaryFixed: Color(4293845759),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4292329727),
      onPrimaryFixedVariant: Color(4280221772),
      secondaryFixed: Color(4293845759),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4292264441),
      onSecondaryFixedVariant: Color(4280028217),
      tertiaryFixed: Color(4293845759),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4292329727),
      onTertiaryFixedVariant: Color(4280221772),
      surfaceDim: Color(4279570970),
      surfaceBright: Color(4282071104),
      surfaceContainerLowest: Color(4279242004),
      surfaceContainerLow: Color(4280097314),
      surfaceContainer: Color(4280360486),
      surfaceContainerHigh: Color(4281084209),
      surfaceContainerHighest: Color(4281807676),
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
