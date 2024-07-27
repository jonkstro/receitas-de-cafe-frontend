import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receitas_de_cafe/state/providers/providers.dart';

class AlternadorTemasWidget extends ConsumerStatefulWidget {
  const AlternadorTemasWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AlternadorTemasWidgetState();
}

class _AlternadorTemasWidgetState extends ConsumerState<AlternadorTemasWidget> {
  @override
  Widget build(BuildContext context) {
    final themeModeStore = ref.read(themeModeProvider);
    var themeMode = themeModeStore.themeMode;

    // Definindo se o modo é escuro ou claro baseado no themeMode
    bool isDarkMode;
    if (themeMode == ThemeMode.system) {
      isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    } else {
      isDarkMode = themeMode == ThemeMode.dark;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Switch between Dark and Light Themes:'),
        const SizedBox(height: 20),
        Switch(
          value: isDarkMode,
          onChanged: (bool value) {
            themeModeStore.toggleThemes(isDarkMode);
            setState(() {}); // Atualiza o widget após mudar o tema
          },
          activeColor: isDarkMode ? Colors.white : Colors.black,
          inactiveThumbColor: isDarkMode ? Colors.white : Colors.black,
          inactiveTrackColor:
              (isDarkMode ? Colors.white : Colors.black).withOpacity(0.5),
        ),
      ],
    );
  }
}
