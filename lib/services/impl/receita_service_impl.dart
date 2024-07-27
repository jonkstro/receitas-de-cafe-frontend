import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:receitas_de_cafe/models/receita_model.dart';
import 'package:receitas_de_cafe/services/receita_service.dart';
import 'package:receitas_de_cafe/utils/constants.dart';

class ReceitaServiceImpl implements ReceitaService {
  static const urlBase = 'localhost:8080';
  static const Duration timeoutDuration = Duration(seconds: 30);
  @override
  Future<List<Receita>> listarReceitas() async {
    try {
      final url = Uri.parse(urlBackend);

      final response = await http
          .get(
            url,
            headers: headersBackend,
          )
          .timeout(timeoutDuration);
      // Verifica se a resposta tem status code 200 (OK)
      if (response.statusCode == 200) {
        // Decodificar pra utf-8 já que, por algum motivo, tava vindo sem ser utf8
        final decodedResponse = utf8.decode(response.bodyBytes);

        // Decodifica a resposta JSON
        final List<dynamic> data = jsonDecode(decodedResponse);

        // Converte o JSON para uma lista de objetos Receita
        return data.map((json) => Receita.fromJson(json)).toList();
      } else {
        // Lança uma exceção se o status code não for 200
        throw Exception('Falha ao carregar receitas: ${response.statusCode}');
      }
    } on TimeoutException {
      // Lida com exceções de timeout
      throw Exception('A requisição ao servidor excedeu o tempo limite.');
    } catch (error) {
      // Lida com erros, como problemas de conexão
      throw Exception('Erro ao carregar receitas: $error');
    }
  }

  @override
  Future<Receita> obterReceita(int idReceita) {
    // TODO: fazer as chamadas ao backend
    throw UnimplementedError();
  }
}
/**
 * final response = await http.post(
      _url,
      body: jsonEncode({
        'nome': produto.nome,
        'descricao': produto.descricao,
        'preco': produto.preco,
        'imagemUrl': produto.imagemUrl,
      }),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );
 */