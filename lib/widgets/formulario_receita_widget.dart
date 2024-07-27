import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receitas_de_cafe/enums/dificuldade_preparo.dart';
import 'package:receitas_de_cafe/enums/loading_states.dart';
import 'package:receitas_de_cafe/models/receita_model.dart';
import 'package:receitas_de_cafe/state/providers/providers.dart';

class FormularioReceitaWidget extends ConsumerStatefulWidget {
  final Receita? receita;
  const FormularioReceitaWidget(this.receita, {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FormularioReceitaWidgetState();
}

class _FormularioReceitaWidgetState
    extends ConsumerState<FormularioReceitaWidget> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController nomeController;
  late TextEditingController descricaoController;
  late TextEditingController ingredientesController;
  late TextEditingController instrucoesController;
  late TextEditingController tempoPreparoController;

  @override
  void initState() {
    super.initState();
    nomeController = TextEditingController(text: widget.receita?.nome ?? '');
    descricaoController =
        TextEditingController(text: widget.receita?.descricao ?? '');
    ingredientesController = TextEditingController(
        text: widget.receita?.ingredientes.join(', ') ?? '');
    instrucoesController = TextEditingController(
        text: widget.receita?.instrucoes.join(', ') ?? '');
    tempoPreparoController = TextEditingController(
        text: widget.receita?.tempoPreparo.toString() ?? '');
  }

  @override
  void dispose() {
    nomeController.dispose();
    descricaoController.dispose();
    ingredientesController.dispose();
    instrucoesController.dispose();
    tempoPreparoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loadingState = ref.watch(loadingProvider);
    final state = ref.watch(formProvider);
    final store = ref.read(formProvider.notifier);

    return loadingState == LoadingStates.carregando
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: nomeController,
                      decoration: const InputDecoration(labelText: 'Nome'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira um nome';
                        }
                        return null;
                      },
                      onChanged: (value) => store.setNome(value),
                    ),
                    TextFormField(
                      controller: descricaoController,
                      decoration: const InputDecoration(labelText: 'Descrição'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira uma descrição';
                        }
                        return null;
                      },
                      onChanged: (value) => store.setDescricao(value),
                    ),
                    TextFormField(
                      controller: ingredientesController,
                      decoration:
                          const InputDecoration(labelText: 'Ingredientes'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira os ingredientes';
                        }
                        return null;
                      },
                      onChanged: (value) => store
                          .setIngredientes(value.trim().split(',').toSet()),
                    ),
                    TextFormField(
                      controller: instrucoesController,
                      decoration:
                          const InputDecoration(labelText: 'Instruções'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira as instruções';
                        }
                        return null;
                      },
                      onChanged: (value) =>
                          store.setInstrucoes(value.trim().split(',').toSet()),
                    ),
                    TextFormField(
                      controller: tempoPreparoController,
                      decoration: const InputDecoration(
                          labelText: 'Tempo de Preparo (minutos)'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o tempo de preparo';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Por favor, insira um número válido';
                        }
                        return null;
                      },
                      onChanged: (value) =>
                          store.setTempoPreparo(int.parse(value)),
                    ),
                    DropdownButtonFormField<DificuldadePreparo>(
                      hint: const Text('Selecione a dificuldade'),
                      value: widget.receita?.dificuldade,
                      items: DificuldadePreparo.values
                          .map((DificuldadePreparo value) {
                        return DropdownMenuItem<DificuldadePreparo>(
                          value: value,
                          child: Text(value.toString().split('.').last),
                        );
                      }).toList(),
                      onChanged: (newValue) => store.setDificuldade(newValue!),
                      validator: (value) {
                        if (value == null) {
                          return 'Por favor, selecione a dificuldade';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await store.submitForm(widget.receita?.id);
                        }
                      },
                      child: Text(widget.receita == null
                          ? 'Salvar Receita'
                          : 'Atualizar Receita'),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
