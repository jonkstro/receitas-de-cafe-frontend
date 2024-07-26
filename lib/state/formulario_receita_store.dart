import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receitas_de_cafe/state/formulario_receita_state.dart';

class FormularioReceitaStore extends StateNotifier<FormularioReceitaState> {
  FormularioReceitaStore() : super(FormularioReceitaState.initial());

  void setNome(String nome) {
    state = state.copyWith(receita: state.receita.copyWith(nome: nome));
  }

  // Adicione métodos para atualizar os outros campos do formulário.

  Future<void> submitForm() async {
    state = state.copyWith(isLoading: true);
    try {
      // Chame o backend para salvar a receita.
      // Por exemplo:
      // await saveReceita(state.receita);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
