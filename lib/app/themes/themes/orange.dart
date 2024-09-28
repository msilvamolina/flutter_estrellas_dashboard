import "package:flutter/material.dart";

import "../util.dart";

class OrangeMaterialTheme {
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4287320064),
      surfaceTint: Color(4287320064),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294944323),
      onPrimaryContainer: Color(4282721536),
      secondary: Color(4286666020),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294953882),
      onSecondaryContainer: Color(4284299015),
      tertiary: Color(4287320064),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294944323),
      onTertiaryContainer: Color(4282721536),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294965493),
      onSurface: Color(4280490513),
      onSurfaceVariant: Color(4283778100),
      outline: Color(4287132513),
      outlineVariant: Color(4292592301),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281937445),
      inversePrimary: Color(4294948976),
      primaryFixed: Color(4294958270),
      onPrimaryFixed: Color(4281079296),
      primaryFixedDim: Color(4294948976),
      onPrimaryFixedVariant: Color(4285086720),
      secondaryFixed: Color(4294958270),
      onSecondaryFixed: Color(4281079296),
      secondaryFixedDim: Color(4294359937),
      onSecondaryFixedVariant: Color(4284890382),
      tertiaryFixed: Color(4294958270),
      onTertiaryFixed: Color(4281079296),
      tertiaryFixedDim: Color(4294948976),
      onTertiaryFixedVariant: Color(4285086720),
      surfaceDim: Color(4293515209),
      surfaceBright: Color(4294965493),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963687),
      surfaceContainer: Color(4294831068),
      surfaceContainerHigh: Color(4294436311),
      surfaceContainerHighest: Color(4294041553),
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
      primary: Color(4284758016),
      surfaceTint: Color(4287320064),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4289356800),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4284561930),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4288375352),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4284758016),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4289356800),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965493),
      onSurface: Color(4280490513),
      onSurfaceVariant: Color(4283449392),
      outline: Color(4285422666),
      outlineVariant: Color(4287395685),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281937445),
      inversePrimary: Color(4294948976),
      primaryFixed: Color(4289356800),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4287057408),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4288375352),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4286534178),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4289356800),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4287057408),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293515209),
      surfaceBright: Color(4294965493),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963687),
      surfaceContainer: Color(4294831068),
      surfaceContainerHigh: Color(4294436311),
      surfaceContainerHighest: Color(4294041553),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281736192),
      surfaceTint: Color(4287320064),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4284758016),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281736192),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284561930),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281736192),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4284758016),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965493),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4281278739),
      outline: Color(4283449392),
      outlineVariant: Color(4283449392),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281937445),
      inversePrimary: Color(4294961365),
      primaryFixed: Color(4284758016),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282721536),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284561930),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282721536),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4284758016),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282721536),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293515209),
      surfaceBright: Color(4294965493),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963687),
      surfaceContainer: Color(4294831068),
      surfaceContainerHigh: Color(4294436311),
      surfaceContainerHighest: Color(4294041553),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294953623),
      surfaceTint: Color(4294948976),
      onPrimary: Color(4283049984),
      primaryContainer: Color(4294349568),
      onPrimaryContainer: Color(4281539072),
      secondary: Color(4294359937),
      onSecondary: Color(4283049984),
      secondaryContainer: Color(4284101636),
      onSecondaryContainer: Color(4294952334),
      tertiary: Color(4294953623),
      onTertiary: Color(4283049984),
      tertiaryContainer: Color(4294349568),
      onTertiaryContainer: Color(4281539072),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279898634),
      onSurface: Color(4294041553),
      onSurfaceVariant: Color(4292592301),
      outline: Color(4288908666),
      outlineVariant: Color(4283778100),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294041553),
      inversePrimary: Color(4287320064),
      primaryFixed: Color(4294958270),
      onPrimaryFixed: Color(4281079296),
      primaryFixedDim: Color(4294948976),
      onPrimaryFixedVariant: Color(4285086720),
      secondaryFixed: Color(4294958270),
      onSecondaryFixed: Color(4281079296),
      secondaryFixedDim: Color(4294359937),
      onSecondaryFixedVariant: Color(4284890382),
      tertiaryFixed: Color(4294958270),
      onTertiaryFixed: Color(4281079296),
      tertiaryFixedDim: Color(4294948976),
      onTertiaryFixedVariant: Color(4285086720),
      surfaceDim: Color(4279898634),
      surfaceBright: Color(4282529581),
      surfaceContainerLowest: Color(4279569670),
      surfaceContainerLow: Color(4280490513),
      surfaceContainer: Color(4280753685),
      surfaceContainerHigh: Color(4281477151),
      surfaceContainerHighest: Color(4282266409),
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
      primary: Color(4294953623),
      surfaceTint: Color(4294948976),
      onPrimary: Color(4281407744),
      primaryContainer: Color(4294349568),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294688644),
      onSecondary: Color(4280619520),
      secondaryContainer: Color(4290479697),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294953623),
      onTertiary: Color(4281407744),
      tertiaryContainer: Color(4294349568),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279898634),
      onSurface: Color(4294966008),
      onSurfaceVariant: Color(4292855473),
      outline: Color(4290158475),
      outlineVariant: Color(4287922029),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294041553),
      inversePrimary: Color(4285218048),
      primaryFixed: Color(4294958270),
      onPrimaryFixed: Color(4280159488),
      primaryFixedDim: Color(4294948976),
      onPrimaryFixedVariant: Color(4283575552),
      secondaryFixed: Color(4294958270),
      onSecondaryFixed: Color(4280159488),
      secondaryFixedDim: Color(4294359937),
      onSecondaryFixedVariant: Color(4283575552),
      tertiaryFixed: Color(4294958270),
      onTertiaryFixed: Color(4280159488),
      tertiaryFixedDim: Color(4294948976),
      onTertiaryFixedVariant: Color(4283575552),
      surfaceDim: Color(4279898634),
      surfaceBright: Color(4282529581),
      surfaceContainerLowest: Color(4279569670),
      surfaceContainerLow: Color(4280490513),
      surfaceContainer: Color(4280753685),
      surfaceContainerHigh: Color(4281477151),
      surfaceContainerHighest: Color(4282266409),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294966008),
      surfaceTint: Color(4294948976),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294950525),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294966008),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4294688644),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294966008),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294950525),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279898634),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294966008),
      outline: Color(4292855473),
      outlineVariant: Color(4292855473),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294041553),
      inversePrimary: Color(4282458880),
      primaryFixed: Color(4294959817),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294950525),
      onPrimaryFixedVariant: Color(4280619520),
      secondaryFixed: Color(4294959817),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4294688644),
      onSecondaryFixedVariant: Color(4280619520),
      tertiaryFixed: Color(4294959817),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294950525),
      onTertiaryFixedVariant: Color(4280619520),
      surfaceDim: Color(4279898634),
      surfaceBright: Color(4282529581),
      surfaceContainerLowest: Color(4279569670),
      surfaceContainerLow: Color(4280490513),
      surfaceContainer: Color(4280753685),
      surfaceContainerHigh: Color(4281477151),
      surfaceContainerHighest: Color(4282266409),
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
