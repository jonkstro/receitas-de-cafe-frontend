import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receitas_de_cafe/models/receita_model.dart';
import 'package:receitas_de_cafe/pages/editar_receita_page.dart';
import 'package:receitas_de_cafe/state/providers/providers.dart';

class ReceitaItemActionButtons extends ConsumerWidget {
  final Receita receita;
  const ReceitaItemActionButtons({required this.receita, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final receitaStore = ref.watch(receitasProvider.notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditarReceitaPage(
                receita: receita,
              ),
            ));
          },
          icon: const Icon(
            Icons.edit,
            size: 16,
            color: Colors.white,
          ), // Ícone e tamanho do ícone
          label: const Text(
            'Editar',
            style: TextStyle(color: Colors.white),
          ), // Texto do botão
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            surfaceTintColor: Colors.transparent, // Cor de fundo
          ),
        ),
        ElevatedButton.icon(
          onPressed: () async {
            final confirmar = await showDialog<bool>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Confirmar exclusão'),
                  content: const Text(
                      'Tem certeza de que deseja deletar esta receita?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false); // Cancela a operação
                      },
                      child: const Text('Não'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true); // Confirma a operação
                      },
                      child: const Text('Sim'),
                    ),
                  ],
                );
              },
            );

            if (confirmar == true) {
              await receitaStore.deletarReceita(receita.id);
            }
          },
          icon: const Icon(
            Icons.delete,
            size: 16,
            color: Colors.white,
          ),
          label: const Text(
            'Excluir',
            style: TextStyle(color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            surfaceTintColor: Colors.transparent, // Cor de fundo
          ),
        ),
      ],
    );
  }
}
