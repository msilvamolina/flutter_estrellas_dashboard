import "package:flutter/material.dart";

import "../util.dart";

class LightGreenMaterialTheme {
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4282280448),
      surfaceTint: Color(4282280448),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4288007763),
      onPrimaryContainer: Color(4280169984),
      secondary: Color(4283393333),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292079281),
      onSecondaryContainer: Color(4282077218),
      tertiary: Color(4282280448),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4288007763),
      onTertiaryContainer: Color(4280169984),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294507500),
      onSurface: Color(4279835924),
      onSurfaceVariant: Color(4282534201),
      outline: Color(4285758055),
      outlineVariant: Color(4290955700),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217576),
      inversePrimary: Color(4288599899),
      primaryFixed: Color(4290376820),
      onPrimaryFixed: Color(4279181312),
      primaryFixedDim: Color(4288599899),
      onPrimaryFixedVariant: Color(4281224960),
      secondaryFixed: Color(4291947439),
      onSecondaryFixed: Color(4279181312),
      secondaryFixedDim: Color(4290105237),
      onSecondaryFixedVariant: Color(4281879840),
      tertiaryFixed: Color(4290376820),
      onTertiaryFixed: Color(4279181312),
      tertiaryFixedDim: Color(4288599899),
      onTertiaryFixedVariant: Color(4281224960),
      surfaceDim: Color(4292467662),
      surfaceBright: Color(4294507500),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294112743),
      surfaceContainer: Color(4293783521),
      surfaceContainerHigh: Color(4293389020),
      surfaceContainerHighest: Color(4292994262),
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
      primary: Color(4281027328),
      surfaceTint: Color(4282280448),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4283400711),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281616668),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284841033),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281027328),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4283400711),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294507500),
      onSurface: Color(4279835924),
      onSurfaceVariant: Color(4282271029),
      outline: Color(4284178768),
      outlineVariant: Color(4285955435),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217576),
      inversePrimary: Color(4288599899),
      primaryFixed: Color(4283400711),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4282214144),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284841033),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4283261747),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4283400711),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4282214144),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292467662),
      surfaceBright: Color(4294507500),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294112743),
      surfaceContainer: Color(4293783521),
      surfaceContainerHigh: Color(4293389020),
      surfaceContainerHighest: Color(4292994262),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4279510784),
      surfaceTint: Color(4282280448),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281027328),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4279510785),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281616668),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4279510784),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4281027328),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294507500),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280296984),
      outline: Color(4282271029),
      outlineVariant: Color(4282271029),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281217576),
      inversePrimary: Color(4290969213),
      primaryFixed: Color(4281027328),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4279972608),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281616668),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4280234504),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4281027328),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4279972608),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292467662),
      surfaceBright: Color(4294507500),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294112743),
      surfaceContainer: Color(4293783521),
      surfaceContainerHigh: Color(4293389020),
      surfaceContainerHighest: Color(4292994262),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4289521256),
      surfaceTint: Color(4288599899),
      onPrimary: Color(4280170240),
      primaryContainer: Color(4286888771),
      onPrimaryContainer: Color(4279444992),
      secondary: Color(4290105237),
      onSecondary: Color(4280432139),
      secondaryContainer: Color(4281221911),
      onSecondaryContainer: Color(4290763166),
      tertiary: Color(4289521256),
      onTertiary: Color(4280170240),
      tertiaryContainer: Color(4286888771),
      onTertiaryContainer: Color(4279444992),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279309580),
      onSurface: Color(4292994262),
      onSurfaceVariant: Color(4290955700),
      outline: Color(4287402880),
      outlineVariant: Color(4282534201),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292994262),
      inversePrimary: Color(4282280448),
      primaryFixed: Color(4290376820),
      onPrimaryFixed: Color(4279181312),
      primaryFixedDim: Color(4288599899),
      onPrimaryFixedVariant: Color(4281224960),
      secondaryFixed: Color(4291947439),
      onSecondaryFixed: Color(4279181312),
      secondaryFixedDim: Color(4290105237),
      onSecondaryFixedVariant: Color(4281879840),
      tertiaryFixed: Color(4290376820),
      onTertiaryFixed: Color(4279181312),
      tertiaryFixedDim: Color(4288599899),
      onTertiaryFixedVariant: Color(4281224960),
      surfaceDim: Color(4279309580),
      surfaceBright: Color(4281809457),
      surfaceContainerLowest: Color(4278980360),
      surfaceContainerLow: Color(4279835924),
      surfaceContainer: Color(4280099096),
      surfaceContainerHigh: Color(4280822562),
      surfaceContainerHighest: Color(4281480748),
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
      primary: Color(4289521256),
      surfaceTint: Color(4288599899),
      onPrimary: Color(4279379200),
      primaryContainer: Color(4286888771),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290433945),
      onSecondary: Color(4278983168),
      secondaryContainer: Color(4286617699),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4289521256),
      onTertiary: Color(4279379200),
      tertiaryContainer: Color(4286888771),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279309580),
      onSurface: Color(4294638830),
      onSurfaceVariant: Color(4291284408),
      outline: Color(4288652690),
      outlineVariant: Color(4286547571),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292994262),
      inversePrimary: Color(4281291008),
      primaryFixed: Color(4290376820),
      onPrimaryFixed: Color(4278719488),
      primaryFixedDim: Color(4288599899),
      onPrimaryFixedVariant: Color(4280433920),
      secondaryFixed: Color(4291947439),
      onSecondaryFixed: Color(4278719488),
      secondaryFixedDim: Color(4290105237),
      onSecondaryFixedVariant: Color(4280826897),
      tertiaryFixed: Color(4290376820),
      onTertiaryFixed: Color(4278719488),
      tertiaryFixedDim: Color(4288599899),
      onTertiaryFixedVariant: Color(4280433920),
      surfaceDim: Color(4279309580),
      surfaceBright: Color(4281809457),
      surfaceContainerLowest: Color(4278980360),
      surfaceContainerLow: Color(4279835924),
      surfaceContainer: Color(4280099096),
      surfaceContainerHigh: Color(4280822562),
      surfaceContainerHighest: Color(4281480748),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294246368),
      surfaceTint: Color(4288599899),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4288863327),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294246368),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290433945),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294246368),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4288863327),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279309580),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294442727),
      outline: Color(4291284408),
      outlineVariant: Color(4291284408),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292994262),
      inversePrimary: Color(4279906304),
      primaryFixed: Color(4290640248),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4288863327),
      onPrimaryFixedVariant: Color(4278983168),
      secondaryFixed: Color(4292210867),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290433945),
      onSecondaryFixedVariant: Color(4278983168),
      tertiaryFixed: Color(4290640248),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4288863327),
      onTertiaryFixedVariant: Color(4278983168),
      surfaceDim: Color(4279309580),
      surfaceBright: Color(4281809457),
      surfaceContainerLowest: Color(4278980360),
      surfaceContainerLow: Color(4279835924),
      surfaceContainer: Color(4280099096),
      surfaceContainerHigh: Color(4280822562),
      surfaceContainerHighest: Color(4281480748),
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
