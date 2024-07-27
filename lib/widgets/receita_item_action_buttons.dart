import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receitas_de_cafe/state/providers/providers.dart';

class ReceitaItemActionButtons extends ConsumerWidget {
  const ReceitaItemActionButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receitaStore = ref.watch(receitasProvider.notifier);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            receitaStore.carregarReceitas();
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('EDITAR RECEITA'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('DELETAR RECEITA'),
        ),
      ],
    );
  }
}
