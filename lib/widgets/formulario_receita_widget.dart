import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:receitas_de_cafe/enums/dificuldade_preparo.dart';
import 'package:receitas_de_cafe/enums/loading_states.dart';
import 'package:receitas_de_cafe/models/receita_model.dart';
import 'package:receitas_de_cafe/pages/lista_receitas_page.dart';
import 'package:receitas_de_cafe/state/formulario_receita_store.dart';
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
  File? _selectedImage;
  String? _imageBase64;

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
    _imageBase64 = widget.receita?.imagemBase64;
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

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _imageBase64 = base64Encode(_selectedImage!.readAsBytesSync());
        ref.read(formProvider.notifier).setImagemBase64(_imageBase64!);
      });
    }
  }

  bool _isBase64Valid(String base64String) {
    try {
      base64Decode(base64String);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final loadingState = ref.watch(loadingProvider);
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
                    _selectedImage != null
                        ? Image.file(_selectedImage!)
                        : widget.receita?.imagemBase64 != null &&
                                _isBase64Valid(widget.receita!.imagemBase64)
                            ? Image.memory(
                                base64Decode(widget.receita!.imagemBase64))
                            : Container(
                                margin: const EdgeInsets.all(8),
                                child: const Text(
                                  'Imagem inválida ou não disponível',
                                ),
                              ),
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: const Text('Selecionar Imagem'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // Assegura que o store é atualizado antes de submeter
                          _atualizarDadosFormulario(store);
                          await store.submitForm(widget.receita?.id);

                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ListaReceitasPage(),
                          ));
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

  void _atualizarDadosFormulario(FormularioReceitaStore store) {
    store.setNome(nomeController.text);
    store.setDescricao(descricaoController.text);
    store
        .setIngredientes(ingredientesController.text.trim().split(',').toSet());
    store.setInstrucoes(instrucoesController.text.trim().split(',').toSet());
    store.setTempoPreparo(int.parse(tempoPreparoController.text));
    if (_imageBase64 != null) {
      store.setImagemBase64(_imageBase64!);
    }
  }
}
