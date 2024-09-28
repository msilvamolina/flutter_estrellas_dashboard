import "package:flutter/material.dart";

import "../util.dart";

class BlueGrayMaterialTheme {
  final TextTheme textTheme;

  const BlueGrayMaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281816161),
      surfaceTint: Color(4282802800),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284250503),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4283785318),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292535788),
      onSecondaryContainer: Color(4282337872),
      tertiary: Color(4281816161),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4284250503),
      onTertiaryContainer: Color(4294967295),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294638074),
      onSurface: Color(4279901213),
      onSurfaceVariant: Color(4282533963),
      outline: Color(4285692027),
      outlineVariant: Color(4290955211),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282609),
      inversePrimary: Color(4289579994),
      primaryFixed: Color(4291422199),
      onPrimaryFixed: Color(4278198058),
      primaryFixedDim: Color(4289579994),
      onPrimaryFixedVariant: Color(4281224023),
      secondaryFixed: Color(4292469995),
      onSecondaryFixed: Color(4279377186),
      secondaryFixedDim: Color(4290627791),
      onSecondaryFixedVariant: Color(4282271822),
      tertiaryFixed: Color(4291422199),
      onTertiaryFixed: Color(4278198058),
      tertiaryFixedDim: Color(4289579994),
      onTertiaryFixedVariant: Color(4281224023),
      surfaceDim: Color(4292532955),
      surfaceBright: Color(4294638074),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294243316),
      surfaceContainer: Color(4293848558),
      surfaceContainerHigh: Color(4293519593),
      surfaceContainerHighest: Color(4293124835),
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
      primary: Color(4280960851),
      surfaceTint: Color(4282802800),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284250503),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282008650),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285232764),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280960851),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4284250503),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294638074),
      onSurface: Color(4279901213),
      onSurfaceVariant: Color(4282270791),
      outline: Color(4284112995),
      outlineVariant: Color(4285954943),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282609),
      inversePrimary: Color(4289579994),
      primaryFixed: Color(4284250503),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282605677),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285232764),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283653731),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4284250503),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282605677),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292532955),
      surfaceBright: Color(4294638074),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294243316),
      surfaceContainer: Color(4293848558),
      surfaceContainerHigh: Color(4293519593),
      surfaceContainerHighest: Color(4293124835),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278462001),
      surfaceTint: Color(4282802800),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280960851),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279837737),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282008650),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278462001),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280960851),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294638074),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280231208),
      outline: Color(4282270791),
      outlineVariant: Color(4282270791),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282609),
      inversePrimary: Color(4292210943),
      primaryFixed: Color(4280960851),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4279316540),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282008650),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280561203),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4280960851),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4279316540),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292532955),
      surfaceBright: Color(4294638074),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294243316),
      surfaceContainer: Color(4293848558),
      surfaceContainerHigh: Color(4293519593),
      surfaceContainerHighest: Color(4293124835),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4289579994),
      surfaceTint: Color(4289579994),
      onPrimary: Color(4279645248),
      primaryContainer: Color(4283921537),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4290627791),
      onSecondary: Color(4280758839),
      secondaryContainer: Color(4281811271),
      onSecondaryContainer: Color(4291548893),
      tertiary: Color(4289579994),
      onTertiary: Color(4279645248),
      tertiaryContainer: Color(4283921537),
      onTertiaryContainer: Color(4294967295),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279374868),
      onSurface: Color(4293124835),
      onSurfaceVariant: Color(4290955211),
      outline: Color(4287402389),
      outlineVariant: Color(4282533963),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293124835),
      inversePrimary: Color(4282802800),
      primaryFixed: Color(4291422199),
      onPrimaryFixed: Color(4278198058),
      primaryFixedDim: Color(4289579994),
      onPrimaryFixedVariant: Color(4281224023),
      secondaryFixed: Color(4292469995),
      onSecondaryFixed: Color(4279377186),
      secondaryFixedDim: Color(4290627791),
      onSecondaryFixedVariant: Color(4282271822),
      tertiaryFixed: Color(4291422199),
      onTertiaryFixed: Color(4278198058),
      tertiaryFixedDim: Color(4289579994),
      onTertiaryFixedVariant: Color(4281224023),
      surfaceDim: Color(4279374868),
      surfaceBright: Color(4281874746),
      surfaceContainerLowest: Color(4279045647),
      surfaceContainerLow: Color(4279901213),
      surfaceContainer: Color(4280164385),
      surfaceContainerHigh: Color(4280887851),
      surfaceContainerHighest: Color(4281611574),
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
      primary: Color(4289843167),
      surfaceTint: Color(4289579994),
      onPrimary: Color(4278196515),
      primaryContainer: Color(4286092707),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290890963),
      onSecondary: Color(4279048221),
      secondaryContainer: Color(4287074969),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4289843167),
      onTertiary: Color(4278196515),
      tertiaryContainer: Color(4286092707),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279374868),
      onSurface: Color(4294703867),
      onSurfaceVariant: Color(4291218383),
      outline: Color(4288586919),
      outlineVariant: Color(4286481543),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293124835),
      inversePrimary: Color(4281289817),
      primaryFixed: Color(4291422199),
      onPrimaryFixed: Color(4278194972),
      primaryFixedDim: Color(4289579994),
      onPrimaryFixedVariant: Color(4280040006),
      secondaryFixed: Color(4292469995),
      onSecondaryFixed: Color(4278719255),
      secondaryFixedDim: Color(4290627791),
      onSecondaryFixedVariant: Color(4281153597),
      tertiaryFixed: Color(4291422199),
      onTertiaryFixed: Color(4278194972),
      tertiaryFixedDim: Color(4289579994),
      onTertiaryFixedVariant: Color(4280040006),
      surfaceDim: Color(4279374868),
      surfaceBright: Color(4281874746),
      surfaceContainerLowest: Color(4279045647),
      surfaceContainerLow: Color(4279901213),
      surfaceContainer: Color(4280164385),
      surfaceContainerHigh: Color(4280887851),
      surfaceContainerHighest: Color(4281611574),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294441983),
      surfaceTint: Color(4289579994),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4289843167),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294441983),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290890963),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294441983),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4289843167),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279374868),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294441983),
      outline: Color(4291218383),
      outlineVariant: Color(4291218383),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293124835),
      inversePrimary: Color(4279119161),
      primaryFixed: Color(4291685371),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4289843167),
      onPrimaryFixedVariant: Color(4278196515),
      secondaryFixed: Color(4292733167),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290890963),
      onSecondaryFixedVariant: Color(4279048221),
      tertiaryFixed: Color(4291685371),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4289843167),
      onTertiaryFixedVariant: Color(4278196515),
      surfaceDim: Color(4279374868),
      surfaceBright: Color(4281874746),
      surfaceContainerLowest: Color(4279045647),
      surfaceContainerLow: Color(4279901213),
      surfaceContainer: Color(4280164385),
      surfaceContainerHigh: Color(4280887851),
      surfaceContainerHighest: Color(4281611574),
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
