import 'package:receitas_de_cafe/models/receita_model.dart';

abstract class ReceitaService {
  Future<List<Receita>> listarReceitas();
  Future<Receita> criarReceita(Receita receita);
  Future<Receita> atualizarReceita(int id, Receita receitaNova);
  Future<void> deletarReceita(int id);
}
