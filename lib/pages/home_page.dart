import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receitas_de_cafe/widgets/alternador_temas_widget.dart';
import 'package:receitas_de_cafe/widgets/app_drawer_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas de Café'),
      ),
      drawer: const AppDrawerWidget(),
      body: const Center(
        child: AlternadorTemasWidget(),
      ),
    );
  }
}
