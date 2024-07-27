import 'package:flutter/material.dart';
import 'package:receitas_de_cafe/utils/constants.dart';

class CustomColorscheme {
  static const light = ColorScheme.light(
    primary: primaryLight,
    secondary: secondaryLight,
    surface: surfacePrimaryLight,
  );
  static const dark = ColorScheme.dark(
    primary: primaryDark,
    secondary: secondaryDark,
    surface: surfacePrimaryDark,
  );
}
