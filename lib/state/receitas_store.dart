import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receitas_de_cafe/models/receita_model.dart';
import 'package:receitas_de_cafe/services/impl/receita_service_impl.dart';
import 'package:receitas_de_cafe/state/providers/providers.dart';

class ReceitaStore extends StateNotifier<List<Receita>> {
  ReceitaStore(this.ref) : super([]);

  final Ref ref;

  Future<void> carregarReceitas() async {
    try {
      ref.read(loadingProvider.notifier).setLoading(true);
      final receitas = await ReceitaServiceImpl().listarReceitas();
      state = receitas;
      ref.read(loadingProvider.notifier).setLoading(false);
    } catch (error) {
      ref.read(loadingProvider.notifier).setError();
      print(error);
    }
  }

  Future<void> adicionarReceita(Receita receita) async {
    try {
      ref.read(loadingProvider.notifier).setLoading(true);
      final novaReceita = await ReceitaServiceImpl().criarReceita(receita);
      state = [...state, novaReceita];
      ref.read(loadingProvider.notifier).setLoading(false);
    } catch (error) {
      ref.read(loadingProvider.notifier).setError();
      print(error);
    }
  }

  Future<void> editarReceita(int id, Receita receitaNova) async {
    try {
      ref.read(loadingProvider.notifier).setLoading(true);
      final receitaAtualizada =
          await ReceitaServiceImpl().atualizarReceita(id, receitaNova);
      state = state.map((receita) {
        return receita.id == id ? receitaAtualizada : receita;
      }).toList();
      ref.read(loadingProvider.notifier).setLoading(false);
    } catch (error) {
      ref.read(loadingProvider.notifier).setError();
      print(error);
    }
  }

  Future<void> deletarReceita(int id) async {
    try {
      ref.read(loadingProvider.notifier).setLoading(true);
      await ReceitaServiceImpl().deletarReceita(id);
      state = state.where((receita) => receita.id != id).toList();
      ref.read(loadingProvider.notifier).setLoading(false);
    } catch (error) {
      ref.read(loadingProvider.notifier).setError();
      print(error);
    }
  }
}
