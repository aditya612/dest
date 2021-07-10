import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_color_scheme/random_color_scheme.dart';

// Color names from [Coolors] ('https://coolors.co/')
/// AppColors provide Color with name use in App
class AppColors {
  // Dark Theme 1
  static const lightSteelBlue = Color(0xffa7beec); // primary
  static const littleBoyBlue = Color(0xff7ca4e5); // primaryVariant
  static const tumbleweed = Color(0xffefaf92); // secondary
  static const rawSienna = Color(0xffe58d57); // secondaryVariant
  static const onyx = Color(0xff3f3f3f); // surface
  static const forestGreenTraditional = Color(0xff0d3c1c); // background

  // Light Theme 1
  static const rust = Color(0xffb04b17); // primary
  static const saddleBrown = Color(0xff8a3910); // primaryVariant
  static const tropicalRainForest = Color(0xff197763); // secondary
  static const castletonGreen = Color(0xff115d4c); // secondaryVariant
  static const piggyPink = Color(0xfff6dfeb); // surface
  static const eggshell = Color(0xffe9e2cb); // background
}

// AppTheme provide [light], [dark] theme for [ThemeData].
class AppTheme {
  AppTheme._();

  static ThemeData get light {
    return ThemeData(
      colorScheme: randomColorSchemeLight(),
      textTheme: _textTheme,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      colorScheme: randomColorSchemeDark(),
      textTheme: _textTheme,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      _themeData(_lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData =
      _themeData(_darkColorScheme, _darkFocusColor);

  static ThemeData _themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      // Matches manifest.json colors and background color.
      primaryColor: const Color(0xFF030303),
      appBarTheme: AppBarTheme(
        textTheme: _textTheme.apply(bodyColor: colorScheme.onPrimary),
        color: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
        brightness: colorScheme.brightness,
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        contentTextStyle: _textTheme.subtitle1!.apply(color: _darkFillColor),
      ),
    );
  }

  static final ColorScheme _lightColorScheme = randomColorSchemeLight();
  static final ColorScheme _darkColorScheme = randomColorSchemeDark();

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final TextTheme _textTheme = TextTheme(
    headline4: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 20.0),
    caption: GoogleFonts.oswald(fontWeight: _semiBold, fontSize: 16.0),
    headline5: GoogleFonts.oswald(fontWeight: _medium, fontSize: 16.0),
    subtitle1: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 16.0),
    overline: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 12.0),
    bodyText1: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 14.0),
    subtitle2: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 14.0),
    bodyText2: GoogleFonts.montserrat(fontWeight: _regular, fontSize: 16.0),
    headline6: GoogleFonts.montserrat(fontWeight: _bold, fontSize: 16.0),
    button: GoogleFonts.montserrat(fontWeight: _semiBold, fontSize: 14.0),
  );
}
