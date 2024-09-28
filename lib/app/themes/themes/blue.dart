import "package:flutter/material.dart";

import "../util.dart";

class BlueMaterialTheme {
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278215076),
      surfaceTint: Color(4278215076),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4282164223),
      onPrimaryContainer: Color(4278194726),
      secondary: Color(4282474628),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4290697983),
      onSecondaryContainer: Color(4280435557),
      tertiary: Color(4278215076),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4282164223),
      onTertiaryContainer: Color(4278194726),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294507007),
      onSurface: Color(4279770146),
      onSurfaceVariant: Color(4282402642),
      outline: Color(4285560963),
      outlineVariant: Color(4290758612),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151799),
      inversePrimary: Color(4288596735),
      primaryFixed: Color(4291945727),
      onPrimaryFixed: Color(4278197558),
      primaryFixedDim: Color(4288596735),
      onPrimaryFixedVariant: Color(4278208893),
      secondaryFixed: Color(4291945727),
      onSecondaryFixed: Color(4278197558),
      secondaryFixedDim: Color(4289317362),
      onSecondaryFixedVariant: Color(4280830315),
      tertiaryFixed: Color(4291945727),
      onTertiaryFixed: Color(4278197558),
      tertiaryFixedDim: Color(4288596735),
      onTertiaryFixedVariant: Color(4278208893),
      surfaceDim: Color(4292336354),
      surfaceBright: Color(4294507007),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294046716),
      surfaceContainer: Color(4293652214),
      surfaceContainerHigh: Color(4293257456),
      surfaceContainerHighest: Color(4292862698),
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
      primary: Color(4278207862),
      surfaceTint: Color(4278215076),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278221000),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280567143),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4283987868),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278207862),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278221000),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294507007),
      onSurface: Color(4279770146),
      onSurfaceVariant: Color(4282139470),
      outline: Color(4283981931),
      outlineVariant: Color(4285758343),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151799),
      inversePrimary: Color(4288596735),
      primaryFixed: Color(4278221000),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278214560),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4283987868),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282343042),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278221000),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278214560),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292336354),
      surfaceBright: Color(4294507007),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294046716),
      surfaceContainer: Color(4293652214),
      surfaceContainerHigh: Color(4293257456),
      surfaceContainerHighest: Color(4292862698),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278199105),
      surfaceTint: Color(4278215076),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278207862),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278199105),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4280567143),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278199105),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278207862),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294507007),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280099886),
      outline: Color(4282139470),
      outlineVariant: Color(4282139470),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151799),
      inversePrimary: Color(4293062143),
      primaryFixed: Color(4278207862),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278201938),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4280567143),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278660687),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278207862),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278201938),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292336354),
      surfaceBright: Color(4294507007),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294046716),
      surfaceContainer: Color(4293652214),
      surfaceContainerHigh: Color(4293257456),
      surfaceContainerHighest: Color(4292862698),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288596735),
      surfaceTint: Color(4288596735),
      onPrimary: Color(4278202968),
      primaryContainer: Color(4278221000),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4289317362),
      onSecondary: Color(4278989395),
      secondaryContainer: Color(4280303971),
      onSecondaryContainer: Color(4290303999),
      tertiary: Color(4288596735),
      onTertiary: Color(4278202968),
      tertiaryContainer: Color(4278221000),
      onTertiaryContainer: Color(4294967295),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279178265),
      onSurface: Color(4292862698),
      onSurfaceVariant: Color(4290758612),
      outline: Color(4287205789),
      outlineVariant: Color(4282402642),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292862698),
      inversePrimary: Color(4278215076),
      primaryFixed: Color(4291945727),
      onPrimaryFixed: Color(4278197558),
      primaryFixedDim: Color(4288596735),
      onPrimaryFixedVariant: Color(4278208893),
      secondaryFixed: Color(4291945727),
      onSecondaryFixed: Color(4278197558),
      secondaryFixedDim: Color(4289317362),
      onSecondaryFixedVariant: Color(4280830315),
      tertiaryFixed: Color(4291945727),
      onTertiaryFixed: Color(4278197558),
      tertiaryFixedDim: Color(4288596735),
      onTertiaryFixedVariant: Color(4278208893),
      surfaceDim: Color(4279178265),
      surfaceBright: Color(4281678144),
      surfaceContainerLowest: Color(4278849044),
      surfaceContainerLow: Color(4279770146),
      surfaceContainer: Color(4280033318),
      surfaceContainerHigh: Color(4280691248),
      surfaceContainerHighest: Color(4281414971),
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
      primary: Color(4289122047),
      surfaceTint: Color(4288596735),
      onPrimary: Color(4278196013),
      primaryContainer: Color(4280194546),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4289580534),
      onSecondary: Color(4278196013),
      secondaryContainer: Color(4285830073),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4289122047),
      onTertiary: Color(4278196013),
      tertiaryContainer: Color(4280194546),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279178265),
      onSurface: Color(4294638335),
      onSurfaceVariant: Color(4291087320),
      outline: Color(4288455600),
      outlineVariant: Color(4286350480),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292862698),
      inversePrimary: Color(4278209151),
      primaryFixed: Color(4291945727),
      onPrimaryFixed: Color(4278194725),
      primaryFixedDim: Color(4288596735),
      onPrimaryFixedVariant: Color(4278204514),
      secondaryFixed: Color(4291945727),
      onSecondaryFixed: Color(4278194725),
      secondaryFixedDim: Color(4289317362),
      onSecondaryFixedVariant: Color(4279580761),
      tertiaryFixed: Color(4291945727),
      onTertiaryFixed: Color(4278194725),
      tertiaryFixedDim: Color(4288596735),
      onTertiaryFixedVariant: Color(4278204514),
      surfaceDim: Color(4279178265),
      surfaceBright: Color(4281678144),
      surfaceContainerLowest: Color(4278849044),
      surfaceContainerLow: Color(4279770146),
      surfaceContainer: Color(4280033318),
      surfaceContainerHigh: Color(4280691248),
      surfaceContainerHighest: Color(4281414971),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294638335),
      surfaceTint: Color(4288596735),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4289122047),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294638335),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4289580534),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294638335),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4289122047),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279178265),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294638335),
      outline: Color(4291087320),
      outlineVariant: Color(4291087320),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292862698),
      inversePrimary: Color(4278201166),
      primaryFixed: Color(4292471039),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4289122047),
      onPrimaryFixedVariant: Color(4278196013),
      secondaryFixed: Color(4292471039),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4289580534),
      onSecondaryFixedVariant: Color(4278196013),
      tertiaryFixed: Color(4292471039),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4289122047),
      onTertiaryFixedVariant: Color(4278196013),
      surfaceDim: Color(4279178265),
      surfaceBright: Color(4281678144),
      surfaceContainerLowest: Color(4278849044),
      surfaceContainerLow: Color(4279770146),
      surfaceContainer: Color(4280033318),
      surfaceContainerHigh: Color(4280691248),
      surfaceContainerHighest: Color(4281414971),
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
