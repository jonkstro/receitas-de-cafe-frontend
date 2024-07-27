import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receitas_de_cafe/enums/loading_states.dart';
import 'package:receitas_de_cafe/state/providers/providers.dart';
import 'package:receitas_de_cafe/widgets/formulario_receita_widget.dart';

class CadastrarReceitaPage extends ConsumerWidget {
  const CadastrarReceitaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadingState = ref.watch(loadingProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Receita'),
      ),
      body: loadingState == LoadingStates.carregando
          ? const Center(child: CircularProgressIndicator())
          : loadingState == LoadingStates.erro
              ? Center(
                  child: Text(
                    'Erro desconhecido.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.red),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.all(20),
                  // Como é pra criar uma receita nova, não vamos passar nada
                  child: const FormularioReceitaWidget(null),
                ),
    );
  }
}
