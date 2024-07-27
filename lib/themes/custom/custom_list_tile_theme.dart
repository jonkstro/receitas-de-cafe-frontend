import 'package:flutter/material.dart';
import 'package:receitas_de_cafe/themes/custom/custom_text_theme.dart';

class CustomListTileTheme {
  static final light = ListTileThemeData(
    titleTextStyle: CustomTextTheme.light.labelMedium,
    subtitleTextStyle: CustomTextTheme.light.labelSmall,
  );
  static final dark = ListTileThemeData(
    titleTextStyle: CustomTextTheme.dark.labelMedium,
    subtitleTextStyle: CustomTextTheme.dark.labelSmall,
  );
}
