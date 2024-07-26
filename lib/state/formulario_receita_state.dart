import 'package:receitas_de_cafe/enums/dificuldade_preparo.dart';
import 'package:receitas_de_cafe/models/receita_model.dart';

class FormularioReceitaState {
  final Receita receita;
  final bool isLoading;
  final String? error;

  FormularioReceitaState({
    required this.receita,
    this.isLoading = false,
    this.error,
  });

  // Método para criar o estado inicial do formulario
  factory FormularioReceitaState.initial() {
    return FormularioReceitaState(
        receita: Receita(
      id: 0,
      nome: '',
      descricao: '',
      ingredientes: <String>{},
      instrucoes: <String>{},
      tempoPreparo: 0,
      dificuldade: DificuldadePreparo.facil,
      imagemBase64: '',
      createdAt: DateTime.now(),
    ));
  }

  FormularioReceitaState copyWith({
    Receita? receita,
    bool? isLoading,
    String? error,
  }) {
    return FormularioReceitaState(
      receita: receita ?? this.receita,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
