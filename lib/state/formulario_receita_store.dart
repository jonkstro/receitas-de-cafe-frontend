import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receitas_de_cafe/enums/dificuldade_preparo.dart';
import 'package:receitas_de_cafe/state/formulario_receita_state.dart';
import 'package:receitas_de_cafe/state/providers/providers.dart';

class FormularioReceitaStore extends StateNotifier<FormularioReceitaState> {
  FormularioReceitaStore(this.ref) : super(FormularioReceitaState.initial());

  final Ref ref;

  void setNome(String nome) {
    state = state.copyWith(receita: state.receita.copyWith(nome: nome));
  }

  void setDescricao(String descricao) {
    state =
        state.copyWith(receita: state.receita.copyWith(descricao: descricao));
  }

  void setIngredientes(Set<String> ingredientes) {
    state = state.copyWith(
        receita: state.receita.copyWith(ingredientes: ingredientes));
  }

  void setInstrucoes(Set<String> instrucoes) {
    state =
        state.copyWith(receita: state.receita.copyWith(instrucoes: instrucoes));
  }

  void setTempoPreparo(int tempoPreparo) {
    state = state.copyWith(
        receita: state.receita.copyWith(tempoPreparo: tempoPreparo));
  }

  void setDificuldade(DificuldadePreparo dificuldade) {
    state = state.copyWith(
        receita: state.receita.copyWith(dificuldade: dificuldade));
  }

  Future<void> submitForm(int? id) async {
    id == null
        ? await ref
            .watch(receitasProvider.notifier)
            .adicionarReceita(state.receita)
        : await ref
            .watch(receitasProvider.notifier)
            .editarReceita(id, state.receita);
  }
}
