import 'package:receitas_de_cafe/models/receita_model.dart';

abstract class ReceitaService {
  Future<List<Receita>> listarReceitas();

  Future<Receita> obterReceita(int idReceita);
}
