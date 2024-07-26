import 'package:receitas_de_cafe/models/receita_model.dart';
import 'package:receitas_de_cafe/services/receita_service.dart';

class ReceitaServiceImpl implements ReceitaService {
  @override
  Future<List<Receita>> listarReceitas() {
    // TODO: fazer as chamadas ao backend
    /**
     * final url = 'constants.url'.toUrl()
     * final response = await http.get(url)
     * final data = jsonDecode(response) as List
     * return data;
     */
    throw UnimplementedError();
  }

  @override
  Future<Receita> obterReceita(int idReceita) {
    // TODO: fazer as chamadas ao backend
    throw UnimplementedError();
  }
}
