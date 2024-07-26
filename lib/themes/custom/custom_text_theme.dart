import 'package:flutter/material.dart';
import 'package:receitas_de_cafe/utils/constants.dart';

class CustomTextTheme {
  static final light = TextTheme(
    labelSmall: _customStyle(
      16,
      bodyTextLight,
      FontWeight.normal,
    ),
    labelMedium: _customStyle(
      18,
      bodyTextLight,
      FontWeight.bold,
    ),
    bodySmall: _customStyle(
      18,
      bodyTextLight,
      FontWeight.normal,
    ),
    bodyMedium: _customStyle(
      18,
      bodyTextLight,
      FontWeight.bold,
    ),
    headlineSmall: _customStyle(
      25,
      bodyTextDark,
      FontWeight.bold,
    ),
    headlineMedium: _customStyle(
      28,
      bodyTextLight,
      FontWeight.bold,
    ),
    headlineLarge: _customStyle(
      30,
      bodyTextLight,
      FontWeight.bold,
    ),
  );
  static final dark = TextTheme(
    labelSmall: _customStyle(
      16,
      bodyTextDark,
      FontWeight.normal,
    ),
    labelMedium: _customStyle(
      18,
      bodyTextDark,
      FontWeight.bold,
    ),
    bodySmall: _customStyle(
      18,
      bodyTextDark,
      FontWeight.normal,
    ),
    bodyMedium: _customStyle(
      18,
      bodyTextDark,
      FontWeight.bold,
    ),
    headlineSmall: _customStyle(
      25,
      bodyTextDark,
      FontWeight.bold,
    ),
    headlineLarge: _customStyle(
      30,
      bodyTextDark,
      FontWeight.bold,
    ),
  );

  static TextStyle _customStyle(
      double fontSize, Color color, FontWeight fontWeight) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }
}
