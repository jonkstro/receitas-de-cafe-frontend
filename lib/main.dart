import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receitas_de_cafe/pages/home_page.dart';
import 'package:receitas_de_cafe/state/providers/providers.dart';
import 'package:receitas_de_cafe/themes/my_themes.dart';

void main() {
  runApp(const ProviderScope(child: ReceitasDeCafeApp()));
}

class ReceitasDeCafeApp extends ConsumerWidget {
  const ReceitasDeCafeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp(
      title: 'Receitas de Café',
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      themeMode: themeMode.themeMode,
      home: const HomePage(),
    );
  }
}
