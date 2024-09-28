import "package:flutter/material.dart";

import "../util.dart";

class IndigoMaterialTheme {
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4280760991),
      surfaceTint: Color(4282602937),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283392197),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4283849860),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291876351),
      onSecondaryContainer: Color(4281876325),
      tertiary: Color(4280760991),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283392197),
      onTertiaryContainer: Color(4294967295),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294703359),
      onSurface: Color(4279900962),
      onSurfaceVariant: Color(4282730066),
      outline: Color(4285888132),
      outlineVariant: Color(4291151316),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282615),
      inversePrimary: Color(4290429951),
      primaryFixed: Color(4292796671),
      onPrimaryFixed: Color(4278194268),
      primaryFixedDim: Color(4290429951),
      onPrimaryFixedVariant: Color(4280892576),
      secondaryFixed: Color(4292796671),
      onSecondaryFixed: Color(4279375933),
      secondaryFixedDim: Color(4290692338),
      onSecondaryFixedVariant: Color(4282270827),
      tertiaryFixed: Color(4292796671),
      onTertiaryFixed: Color(4278194268),
      tertiaryFixedDim: Color(4290429951),
      onTertiaryFixedVariant: Color(4280892576),
      surfaceDim: Color(4292598242),
      surfaceBright: Color(4294703359),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294243068),
      surfaceContainer: Color(4293914102),
      surfaceContainerHigh: Color(4293519344),
      surfaceContainerHighest: Color(4293124586),
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
      primary: Color(4280563868),
      surfaceTint: Color(4282602937),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283392197),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282007654),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4285297307),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280563868),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283392197),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294703359),
      onSurface: Color(4279900962),
      onSurfaceVariant: Color(4282466894),
      outline: Color(4284309099),
      outlineVariant: Color(4286151303),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282615),
      inversePrimary: Color(4290429951),
      primaryFixed: Color(4284181713),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282471351),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4285297307),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283652481),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4284181713),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282471351),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292598242),
      surfaceBright: Color(4294703359),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294243068),
      surfaceContainer: Color(4293914102),
      surfaceContainerHigh: Color(4293519344),
      surfaceContainerHighest: Color(4293124586),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278195309),
      surfaceTint: Color(4282602937),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280563868),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279836484),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4282007654),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278195309),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280563868),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294703359),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280427311),
      outline: Color(4282466894),
      outlineVariant: Color(4282466894),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282615),
      inversePrimary: Color(4293585663),
      primaryFixed: Color(4280563868),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278262918),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4282007654),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280560207),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4280563868),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278262918),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292598242),
      surfaceBright: Color(4294703359),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294243068),
      surfaceContainer: Color(4293914102),
      surfaceContainerHigh: Color(4293519344),
      surfaceContainerHighest: Color(4293124586),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4290429951),
      surfaceTint: Color(4290429951),
      onPrimary: Color(4278722954),
      primaryContainer: Color(4281681835),
      onPrimaryContainer: Color(4294045951),
      secondary: Color(4290692338),
      onSecondary: Color(4280757843),
      secondaryContainer: Color(4281613152),
      onSecondaryContainer: Color(4291350268),
      tertiary: Color(4290429951),
      onTertiary: Color(4278722954),
      tertiaryContainer: Color(4281681835),
      onTertiaryContainer: Color(4294045951),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279374617),
      onSurface: Color(4293124586),
      onSurfaceVariant: Color(4291151316),
      outline: Color(4287598750),
      outlineVariant: Color(4282730066),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293124586),
      inversePrimary: Color(4282602937),
      primaryFixed: Color(4292796671),
      onPrimaryFixed: Color(4278194268),
      primaryFixedDim: Color(4290429951),
      onPrimaryFixedVariant: Color(4280892576),
      secondaryFixed: Color(4292796671),
      onSecondaryFixed: Color(4279375933),
      secondaryFixedDim: Color(4290692338),
      onSecondaryFixedVariant: Color(4282270827),
      tertiaryFixed: Color(4292796671),
      onTertiaryFixed: Color(4278194268),
      tertiaryFixedDim: Color(4290429951),
      onTertiaryFixedVariant: Color(4280892576),
      surfaceDim: Color(4279374617),
      surfaceBright: Color(4281874752),
      surfaceContainerLowest: Color(4279045652),
      surfaceContainerLow: Color(4279900962),
      surfaceContainer: Color(4280229670),
      surfaceContainerHigh: Color(4280887600),
      surfaceContainerHighest: Color(4281611323),
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
      primary: Color(4290824191),
      surfaceTint: Color(4290429951),
      onPrimary: Color(4278193230),
      primaryContainer: Color(4286024176),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290955510),
      onSecondary: Color(4278981431),
      secondaryContainer: Color(4287139513),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4290824191),
      onTertiary: Color(4278193230),
      tertiaryContainer: Color(4286024176),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279374617),
      onSurface: Color(4294834943),
      onSurfaceVariant: Color(4291480025),
      outline: Color(4288783024),
      outlineVariant: Color(4286677648),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293124586),
      inversePrimary: Color(4280958369),
      primaryFixed: Color(4292796671),
      onPrimaryFixed: Color(4278192193),
      primaryFixedDim: Color(4290429951),
      onPrimaryFixedVariant: Color(4279445903),
      secondaryFixed: Color(4292796671),
      onSecondaryFixed: Color(4278652210),
      secondaryFixedDim: Color(4290692338),
      onSecondaryFixedVariant: Color(4281152601),
      tertiaryFixed: Color(4292796671),
      onTertiaryFixed: Color(4278192193),
      tertiaryFixedDim: Color(4290429951),
      onTertiaryFixedVariant: Color(4279445903),
      surfaceDim: Color(4279374617),
      surfaceBright: Color(4281874752),
      surfaceContainerLowest: Color(4279045652),
      surfaceContainerLow: Color(4279900962),
      surfaceContainer: Color(4280229670),
      surfaceContainerHigh: Color(4280887600),
      surfaceContainerHighest: Color(4281611323),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294834943),
      surfaceTint: Color(4290429951),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4290824191),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294834943),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290955510),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294834943),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4290824191),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279374617),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294834943),
      outline: Color(4291480025),
      outlineVariant: Color(4291480025),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293124586),
      inversePrimary: Color(4278196865),
      primaryFixed: Color(4293191167),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4290824191),
      onPrimaryFixedVariant: Color(4278193230),
      secondaryFixed: Color(4293191167),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290955510),
      onSecondaryFixedVariant: Color(4278981431),
      tertiaryFixed: Color(4293191167),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4290824191),
      onTertiaryFixedVariant: Color(4278193230),
      surfaceDim: Color(4279374617),
      surfaceBright: Color(4281874752),
      surfaceContainerLowest: Color(4279045652),
      surfaceContainerLow: Color(4279900962),
      surfaceContainer: Color(4280229670),
      surfaceContainerHigh: Color(4280887600),
      surfaceContainerHighest: Color(4281611323),
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
