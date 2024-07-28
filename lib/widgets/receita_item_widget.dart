import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:receitas_de_cafe/models/receita_model.dart';
import 'package:receitas_de_cafe/widgets/receita_item_action_buttons.dart';

class ReceitaItemWidget extends StatelessWidget {
  final Receita receita;
  const ReceitaItemWidget({super.key, required this.receita});

  bool _isValidBase64(String base64String) {
    try {
      final bytes = base64Decode(base64String);
      return bytes.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Uint8List? imageBytes;
    if (_isValidBase64(receita.imagemBase64)) {
      imageBytes = base64Decode(receita.imagemBase64);
    }
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: ClipOval(
            child: imageBytes != null
                ? Image.memory(
                    imageBytes,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  )
                : const Icon(Icons.image_not_supported),
          ),
        ),
        title: Text('Nome: ${receita.nome}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Descrição: ${receita.descricao}'),
            Text('Dificuldade: ${receita.dificuldade.name}'),
            Text('Tempo de Preparo: ${receita.tempoPreparo} mins'),
            const SizedBox(height: 8),
            const Text('Ingredientes:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            ...receita.ingredientes
                .map((ingrediente) => Text('- $ingrediente')),
            const SizedBox(height: 8),
            const Text('Instruções:',
                style: TextStyle(fontWeight: FontWeight.bold)),
            ...receita.instrucoes.map((instrucao) => Text('- $instrucao')),
            const SizedBox(
              height: 20,
            ),
            ReceitaItemActionButtons(receita: receita),
          ],
        ),
        // trailing: const ReceitaItemActionButtons(),
      ),
    );
  }
}
