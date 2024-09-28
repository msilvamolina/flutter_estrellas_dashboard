import "package:flutter/material.dart";

import "../util.dart";

class PurpleMaterialTheme {
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4286644374),
      surfaceTint: Color(4288292270),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4289542592),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4286597766),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294820351),
      onSecondaryContainer: Color(4284361573),
      tertiary: Color(4286644374),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4289542592),
      onTertiaryContainer: Color(4294967295),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294965242),
      onSurface: Color(4280359201),
      onSurfaceVariant: Color(4283515472),
      outline: Color(4286804609),
      outlineVariant: Color(4292198866),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281806134),
      inversePrimary: Color(4294552575),
      primaryFixed: Color(4294956798),
      onPrimaryFixed: Color(4281663551),
      primaryFixedDim: Color(4294552575),
      onPrimaryFixedVariant: Color(4286251151),
      secondaryFixed: Color(4294956798),
      onSecondaryFixed: Color(4281663806),
      secondaryFixedDim: Color(4294095349),
      onSecondaryFixedVariant: Color(4284887661),
      tertiaryFixed: Color(4294956798),
      onTertiaryFixed: Color(4281663551),
      tertiaryFixedDim: Color(4294552575),
      onTertiaryFixedVariant: Color(4286251151),
      surfaceDim: Color(4293252833),
      surfaceBright: Color(4294965242),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963195),
      surfaceContainer: Color(4294568437),
      surfaceContainerHigh: Color(4294173935),
      surfaceContainerHighest: Color(4293844714),
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
      primary: Color(4285857928),
      surfaceTint: Color(4288292270),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4289542592),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4284624489),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4288241822),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4285857928),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4289542592),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965242),
      onSurface: Color(4280359201),
      onSurfaceVariant: Color(4283252300),
      outline: Color(4285160041),
      outlineVariant: Color(4287067525),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281806134),
      inversePrimary: Color(4294552575),
      primaryFixed: Color(4290003399),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4288094636),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4288241822),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4286466180),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4290003399),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4288094636),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293252833),
      surfaceBright: Color(4294965242),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963195),
      surfaceContainer: Color(4294568437),
      surfaceContainerHigh: Color(4294173935),
      surfaceContainerHighest: Color(4293844714),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4282384459),
      surfaceTint: Color(4288292270),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285857928),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282190149),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284624489),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282384459),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285857928),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965242),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4281081901),
      outline: Color(4283252300),
      outlineVariant: Color(4283252300),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281806134),
      inversePrimary: Color(4294960380),
      primaryFixed: Color(4285857928),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283498591),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284624489),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282979921),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285857928),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283498591),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293252833),
      surfaceBright: Color(4294965242),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963195),
      surfaceContainer: Color(4294568437),
      surfaceContainerHigh: Color(4294173935),
      surfaceContainerHighest: Color(4293844714),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294552575),
      surfaceTint: Color(4294552575),
      onPrimary: Color(4283891814),
      primaryContainer: Color(4287765159),
      onPrimaryContainer: Color(4294966527),
      secondary: Color(4294095349),
      onSecondary: Color(4283243349),
      secondaryContainer: Color(4284229987),
      onSecondaryContainer: Color(4294753535),
      tertiary: Color(4294552575),
      onTertiary: Color(4283891814),
      tertiaryContainer: Color(4287765159),
      onTertiaryContainer: Color(4294966527),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279832857),
      onSurface: Color(4293844714),
      onSurfaceVariant: Color(4292198866),
      outline: Color(4288514971),
      outlineVariant: Color(4283515472),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293844714),
      inversePrimary: Color(4288292270),
      primaryFixed: Color(4294956798),
      onPrimaryFixed: Color(4281663551),
      primaryFixedDim: Color(4294552575),
      onPrimaryFixedVariant: Color(4286251151),
      secondaryFixed: Color(4294956798),
      onSecondaryFixed: Color(4281663806),
      secondaryFixedDim: Color(4294095349),
      onSecondaryFixedVariant: Color(4284887661),
      tertiaryFixed: Color(4294956798),
      onTertiaryFixed: Color(4281663551),
      tertiaryFixedDim: Color(4294552575),
      onTertiaryFixedVariant: Color(4286251151),
      surfaceDim: Color(4279832857),
      surfaceBright: Color(4282398271),
      surfaceContainerLowest: Color(4279438355),
      surfaceContainerLow: Color(4280359201),
      surfaceContainer: Color(4280622373),
      surfaceContainerHigh: Color(4281345840),
      surfaceContainerHighest: Color(4282069563),
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
      primary: Color(4294685439),
      surfaceTint: Color(4294552575),
      onPrimary: Color(4281139253),
      primaryContainer: Color(4292174054),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294358521),
      onSecondary: Color(4281139253),
      secondaryContainer: Color(4290280636),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294685439),
      onTertiary: Color(4281139253),
      tertiaryContainer: Color(4292174054),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279832857),
      onSurface: Color(4294965754),
      onSurfaceVariant: Color(4292462038),
      outline: Color(4289764782),
      outlineVariant: Color(4287594126),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293844714),
      inversePrimary: Color(4286382226),
      primaryFixed: Color(4294956798),
      onPrimaryFixed: Color(4280549420),
      primaryFixedDim: Color(4294552575),
      onPrimaryFixedVariant: Color(4284481649),
      secondaryFixed: Color(4294956798),
      onSecondaryFixed: Color(4280549420),
      secondaryFixedDim: Color(4294095349),
      onSecondaryFixedVariant: Color(4283638107),
      tertiaryFixed: Color(4294956798),
      onTertiaryFixed: Color(4280549420),
      tertiaryFixedDim: Color(4294552575),
      onTertiaryFixedVariant: Color(4284481649),
      surfaceDim: Color(4279832857),
      surfaceBright: Color(4282398271),
      surfaceContainerLowest: Color(4279438355),
      surfaceContainerLow: Color(4280359201),
      surfaceContainer: Color(4280622373),
      surfaceContainerHigh: Color(4281345840),
      surfaceContainerHighest: Color(4282069563),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294965754),
      surfaceTint: Color(4294552575),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294685439),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965754),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4294358521),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965754),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294685439),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279832857),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294965754),
      outline: Color(4292462038),
      outlineVariant: Color(4292462038),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293844714),
      inversePrimary: Color(4283236442),
      primaryFixed: Color(4294958333),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294685439),
      onPrimaryFixedVariant: Color(4281139253),
      secondaryFixed: Color(4294958333),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4294358521),
      onSecondaryFixedVariant: Color(4281139253),
      tertiaryFixed: Color(4294958333),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294685439),
      onTertiaryFixedVariant: Color(4281139253),
      surfaceDim: Color(4279832857),
      surfaceBright: Color(4282398271),
      surfaceContainerLowest: Color(4279438355),
      surfaceContainerLow: Color(4280359201),
      surfaceContainer: Color(4280622373),
      surfaceContainerHigh: Color(4281345840),
      surfaceContainerHighest: Color(4282069563),
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
