import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receitas_de_cafe/state/providers/providers.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeModeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Switcher'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Switch between Dark and Light Themes 2:'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => theme.toggleDark(),
                  child: const Text('Dark'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => theme.toggleLight(),
                  child: const Text('Light'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
