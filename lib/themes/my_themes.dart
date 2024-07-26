import 'package:flutter/material.dart';
import 'package:receitas_de_cafe/themes/custom/custom_colorscheme.dart';
import 'package:receitas_de_cafe/themes/custom/custom_text_theme.dart';

class MyThemes {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    textTheme: CustomTextTheme.light,
    colorScheme: CustomColorscheme.light,
    // TODO: Add (se necessário) inputDecorationTheme, elevatedButtonTheme, listTileTheme
  );
  static final darkTheme = ThemeData(
    useMaterial3: true,
    textTheme: CustomTextTheme.dark,
    colorScheme: CustomColorscheme.dark,
  );
}
