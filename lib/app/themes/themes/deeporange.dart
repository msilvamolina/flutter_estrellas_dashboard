import "package:flutter/material.dart";

import "../util.dart";

class DeepOrangeMaterialTheme {
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4289736448),
      surfaceTint: Color(4289736448),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294930759),
      onPrimaryContainer: Color(4280550400),
      secondary: Color(4288626981),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294940537),
      onSecondaryContainer: Color(4283371520),
      tertiary: Color(4289736448),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294930759),
      onTertiaryContainer: Color(4280550400),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294965494),
      onSurface: Color(4280752147),
      onSurfaceVariant: Color(4284170297),
      outline: Color(4287656039),
      outlineVariant: Color(4293181108),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4282264615),
      inversePrimary: Color(4294948256),
      primaryFixed: Color(4294958033),
      onPrimaryFixed: Color(4282059008),
      primaryFixedDim: Color(4294948256),
      onPrimaryFixedVariant: Color(4286980608),
      secondaryFixed: Color(4294958033),
      onSecondaryFixed: Color(4282059008),
      secondaryFixedDim: Color(4294948256),
      onSecondaryFixedVariant: Color(4286523920),
      tertiaryFixed: Color(4294958033),
      onTertiaryFixed: Color(4282059008),
      tertiaryFixedDim: Color(4294948256),
      onTertiaryFixedVariant: Color(4286980608),
      surfaceDim: Color(4294038732),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963693),
      surfaceContainer: Color(4294961636),
      surfaceContainerHigh: Color(4294959834),
      surfaceContainerHighest: Color(4294630612),
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
      primary: Color(4286586880),
      surfaceTint: Color(4289736448),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4292295424),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4286195212),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4290467384),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4286586880),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4292295424),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965494),
      onSurface: Color(4280752147),
      onSurfaceVariant: Color(4283907125),
      outline: Color(4285945936),
      outlineVariant: Color(4287918955),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4282264615),
      inversePrimary: Color(4294948256),
      primaryFixed: Color(4292295424),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4289474048),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4290467384),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4288364323),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4292295424),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4289474048),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4294038732),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963693),
      surfaceContainer: Color(4294961636),
      surfaceContainerHigh: Color(4294959834),
      surfaceContainerHighest: Color(4294630612),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4282780928),
      surfaceTint: Color(4289736448),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4286586880),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4282780928),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4286195212),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282780928),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4286586880),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965494),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4281605656),
      outline: Color(4283907125),
      outlineVariant: Color(4283907125),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4282264615),
      inversePrimary: Color(4294961121),
      primaryFixed: Color(4286586880),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4284027648),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4286195212),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4284027648),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4286586880),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4284027648),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4294038732),
      surfaceBright: Color(4294965494),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294963693),
      surfaceContainer: Color(4294961636),
      surfaceContainerHigh: Color(4294959834),
      surfaceContainerHighest: Color(4294630612),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294948256),
      surfaceTint: Color(4294948256),
      onPrimary: Color(4284421376),
      primaryContainer: Color(4292295424),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4294948256),
      onSecondary: Color(4284421376),
      secondaryContainer: Color(4285735175),
      onSecondaryContainer: Color(4294952116),
      tertiary: Color(4294948256),
      onTertiary: Color(4284421376),
      tertiaryContainer: Color(4292295424),
      onTertiaryContainer: Color(4294967295),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4280160268),
      onSurface: Color(4294630612),
      onSurfaceVariant: Color(4293181108),
      outline: Color(4289431936),
      outlineVariant: Color(4284170297),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294630612),
      inversePrimary: Color(4289736448),
      primaryFixed: Color(4294958033),
      onPrimaryFixed: Color(4282059008),
      primaryFixedDim: Color(4294948256),
      onPrimaryFixedVariant: Color(4286980608),
      secondaryFixed: Color(4294958033),
      onSecondaryFixed: Color(4282059008),
      secondaryFixedDim: Color(4294948256),
      onSecondaryFixedVariant: Color(4286523920),
      tertiaryFixed: Color(4294958033),
      onTertiaryFixed: Color(4282059008),
      tertiaryFixedDim: Color(4294948256),
      onTertiaryFixedVariant: Color(4286980608),
      surfaceDim: Color(4280160268),
      surfaceBright: Color(4282922288),
      surfaceContainerLowest: Color(4279765767),
      surfaceContainerLow: Color(4280752147),
      surfaceContainer: Color(4281080855),
      surfaceContainerHigh: Color(4281804321),
      surfaceContainerHighest: Color(4282593323),
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
      primary: Color(4294949799),
      surfaceTint: Color(4294948256),
      onPrimary: Color(4281403136),
      primaryContainer: Color(4294924066),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294949799),
      onSecondary: Color(4281403136),
      secondaryContainer: Color(4292833617),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294949799),
      onTertiary: Color(4281403136),
      tertiaryContainer: Color(4294924066),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4280160268),
      onSurface: Color(4294965752),
      onSurfaceVariant: Color(4293509816),
      outline: Color(4290681745),
      outlineVariant: Color(4288511091),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294630612),
      inversePrimary: Color(4287177216),
      primaryFixed: Color(4294958033),
      onPrimaryFixed: Color(4280812800),
      primaryFixedDim: Color(4294948256),
      onPrimaryFixedVariant: Color(4285077504),
      secondaryFixed: Color(4294958033),
      onSecondaryFixed: Color(4280812800),
      secondaryFixedDim: Color(4294948256),
      onSecondaryFixedVariant: Color(4285012482),
      tertiaryFixed: Color(4294958033),
      onTertiaryFixed: Color(4280812800),
      tertiaryFixedDim: Color(4294948256),
      onTertiaryFixedVariant: Color(4285077504),
      surfaceDim: Color(4280160268),
      surfaceBright: Color(4282922288),
      surfaceContainerLowest: Color(4279765767),
      surfaceContainerLow: Color(4280752147),
      surfaceContainer: Color(4281080855),
      surfaceContainerHigh: Color(4281804321),
      surfaceContainerHighest: Color(4282593323),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294965752),
      surfaceTint: Color(4294948256),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294949799),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965752),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4294949799),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965752),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294949799),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4280160268),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294965752),
      outline: Color(4293509816),
      outlineVariant: Color(4293509816),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4294630612),
      inversePrimary: Color(4283699712),
      primaryFixed: Color(4294959320),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294949799),
      onPrimaryFixedVariant: Color(4281403136),
      secondaryFixed: Color(4294959320),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4294949799),
      onSecondaryFixedVariant: Color(4281403136),
      tertiaryFixed: Color(4294959320),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294949799),
      onTertiaryFixedVariant: Color(4281403136),
      surfaceDim: Color(4280160268),
      surfaceBright: Color(4282922288),
      surfaceContainerLowest: Color(4279765767),
      surfaceContainerLow: Color(4280752147),
      surfaceContainer: Color(4281080855),
      surfaceContainerHigh: Color(4281804321),
      surfaceContainerHighest: Color(4282593323),
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
