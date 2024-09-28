import "package:flutter/material.dart";

import "../util.dart";

class BrownMaterialTheme {
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4284629044),
      surfaceTint: Color(4286207561),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4287194198),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4285356628),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294500054),
      onSecondaryContainer: Color(4283843903),
      tertiary: Color(4284629044),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4287194198),
      onTertiaryContainer: Color(4294967295),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294965494),
      onSurface: Color(4280163098),
      onSurfaceVariant: Color(4283450432),
      outline: Color(4286739567),
      outlineVariant: Color(4292133821),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281610030),
      inversePrimary: Color(4293639340),
      primaryFixed: Color(4294958031),
      onPrimaryFixed: Color(4281210123),
      primaryFixedDim: Color(4293639340),
      onPrimaryFixedVariant: Color(4284497715),
      secondaryFixed: Color(4294434261),
      onSecondaryFixed: Color(4280686612),
      secondaryFixedDim: Color(4292526521),
      onSecondaryFixedVariant: Color(4283712317),
      tertiaryFixed: Color(4294958031),
      onTertiaryFixed: Color(4281210123),
      tertiaryFixedDim: Color(4293639340),
      onTertiaryFixedVariant: Color(4284497715),
      surfaceDim: Color(4292991190),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294701807),
      surfaceContainer: Color(4294307049),
      surfaceContainerHigh: Color(4293912292),
      surfaceContainerHighest: Color(4293517790),
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
      primary: Color(4284169007),
      surfaceTint: Color(4286207561),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4287194198),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4283449145),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4286869609),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4284169007),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4287194198),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965494),
      onSurface: Color(4280163098),
      onSurfaceVariant: Color(4283187260),
      outline: Color(4285160536),
      outlineVariant: Color(4287002739),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281610030),
      inversePrimary: Color(4293639340),
      primaryFixed: Color(4287786078),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4286010439),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4286869609),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4285225041),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4287786078),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4286010439),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292991190),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294701807),
      surfaceContainer: Color(4294307049),
      surfaceContainerHigh: Color(4293912292),
      surfaceContainerHighest: Color(4293517790),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281735953),
      surfaceTint: Color(4286207561),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284169007),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281147162),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283449145),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281735953),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4284169007),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965494),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4281082398),
      outline: Color(4283187260),
      outlineVariant: Color(4283187260),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281610030),
      inversePrimary: Color(4294961119),
      primaryFixed: Color(4284169007),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282524955),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4283449145),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4281870628),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4284169007),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282524955),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292991190),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294701807),
      surfaceContainer: Color(4294307049),
      surfaceContainerHigh: Color(4293912292),
      surfaceContainerHighest: Color(4293517790),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4293639340),
      surfaceTint: Color(4293639340),
      onPrimary: Color(4282788126),
      primaryContainer: Color(4285484095),
      onPrimaryContainer: Color(4294964723),
      secondary: Color(4292526521),
      onSecondary: Color(4282133799),
      secondaryContainer: Color(4283186230),
      onSecondaryContainer: Color(4293447623),
      tertiary: Color(4293639340),
      onTertiary: Color(4282788126),
      tertiaryContainer: Color(4285484095),
      onTertiaryContainer: Color(4294964723),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279636753),
      onSurface: Color(4293517790),
      onSurfaceVariant: Color(4292133821),
      outline: Color(4288515464),
      outlineVariant: Color(4283450432),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293517790),
      inversePrimary: Color(4286207561),
      primaryFixed: Color(4294958031),
      onPrimaryFixed: Color(4281210123),
      primaryFixedDim: Color(4293639340),
      onPrimaryFixedVariant: Color(4284497715),
      secondaryFixed: Color(4294434261),
      onSecondaryFixed: Color(4280686612),
      secondaryFixedDim: Color(4292526521),
      onSecondaryFixedVariant: Color(4283712317),
      tertiaryFixed: Color(4294958031),
      onTertiaryFixed: Color(4281210123),
      tertiaryFixedDim: Color(4293639340),
      onTertiaryFixedVariant: Color(4284497715),
      surfaceDim: Color(4279636753),
      surfaceBright: Color(4282202167),
      surfaceContainerLowest: Color(4279307532),
      surfaceContainerLow: Color(4280163098),
      surfaceContainer: Color(4280491805),
      surfaceContainerHigh: Color(4281149736),
      surfaceContainerHighest: Color(4281873458),
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
      primary: Color(4293968048),
      surfaceTint: Color(4293639340),
      onPrimary: Color(4280815623),
      primaryContainer: Color(4289824632),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4292789693),
      onSecondary: Color(4280292111),
      secondaryContainer: Color(4288842885),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293968048),
      onTertiary: Color(4280815623),
      tertiaryContainer: Color(4289824632),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279636753),
      onSurface: Color(4294965752),
      onSurfaceVariant: Color(4292462529),
      outline: Color(4289765274),
      outlineVariant: Color(4287594619),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293517790),
      inversePrimary: Color(4284563508),
      primaryFixed: Color(4294958031),
      onPrimaryFixed: Color(4280355587),
      primaryFixedDim: Color(4293639340),
      onPrimaryFixedVariant: Color(4283248419),
      secondaryFixed: Color(4294434261),
      onSecondaryFixed: Color(4279897610),
      secondaryFixedDim: Color(4292526521),
      onSecondaryFixedVariant: Color(4282594093),
      tertiaryFixed: Color(4294958031),
      onTertiaryFixed: Color(4280355587),
      tertiaryFixedDim: Color(4293639340),
      onTertiaryFixedVariant: Color(4283248419),
      surfaceDim: Color(4279636753),
      surfaceBright: Color(4282202167),
      surfaceContainerLowest: Color(4279307532),
      surfaceContainerLow: Color(4280163098),
      surfaceContainer: Color(4280491805),
      surfaceContainerHigh: Color(4281149736),
      surfaceContainerHighest: Color(4281873458),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294965752),
      surfaceTint: Color(4293639340),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4293968048),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965752),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4292789693),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965752),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4293968048),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279636753),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294965752),
      outline: Color(4292462529),
      outlineVariant: Color(4292462529),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293517790),
      inversePrimary: Color(4282327832),
      primaryFixed: Color(4294959318),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4293968048),
      onPrimaryFixedVariant: Color(4280815623),
      secondaryFixed: Color(4294762969),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4292789693),
      onSecondaryFixedVariant: Color(4280292111),
      tertiaryFixed: Color(4294959318),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4293968048),
      onTertiaryFixedVariant: Color(4280815623),
      surfaceDim: Color(4279636753),
      surfaceBright: Color(4282202167),
      surfaceContainerLowest: Color(4279307532),
      surfaceContainerLow: Color(4280163098),
      surfaceContainer: Color(4280491805),
      surfaceContainerHigh: Color(4281149736),
      surfaceContainerHighest: Color(4281873458),
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
