import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receitas_de_cafe/state/providers/providers.dart';
import 'package:receitas_de_cafe/widgets/receita_item_widget.dart';

class ListaReceitasPage extends ConsumerWidget {
  const ListaReceitasPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> refreshReceitas() async {
      await ref.read(receitasProvider.notifier).carregarReceitas();
    }

    final receitas = ref.watch(receitasProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Receitas de Café')),
      body: receitas.isNotEmpty
          ? RefreshIndicator(
              onRefresh: refreshReceitas,
              child: ListView.builder(
                itemCount: receitas.length,
                itemBuilder: (context, index) {
                  final receita = receitas[index];
                  return ReceitaItemWidget(receita: receita);
                  //  ListTile(
                  //   title: Text(receita.nome),
                  //   subtitle: Text(receita.descricao),
                  // );
                },
              ),
            )
          : Center(
              child: Text(
                'Nenhuma receita cadastrada ainda',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
    );
  }
}
