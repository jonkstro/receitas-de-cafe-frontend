import 'package:flutter/material.dart';
import 'package:receitas_de_cafe/utils/constants.dart';

class CustomColorscheme {
  static const light = ColorScheme.light(
    primary: primaryColor,
    secondary: secondaryColor,
    surface: backgroundPrimaryLight,
    onSurface: backgroundSecondaryLight,
    onPrimary: primaryColor,
  );
  static const dark = ColorScheme.dark(
    primary: backgroundSecondaryLight,
    secondary: secondaryColor,
    surface: backgroundPrimaryDark,
    onSurface: backgroundSecondaryDark,
    onPrimary: backgroundPrimaryLight,
  );
}
