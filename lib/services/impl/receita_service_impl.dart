import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:receitas_de_cafe/models/receita_model.dart';
import 'package:receitas_de_cafe/services/receita_service.dart';
import 'package:receitas_de_cafe/utils/constants.dart';

class ReceitaServiceImpl implements ReceitaService {
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
        return data.isNotEmpty
            ? data.map((json) => Receita.fromJson(json)).toList()
            : [];
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
  Future<Receita> atualizarReceita(int id, Receita receitaNova) async {
    try {
      final url = Uri.parse('$urlBackend/$id');
      final body = jsonEncode(receitaNova.toJson());
      final response = await http
          .put(
            url,
            headers: headersBackend,
            body: body,
          )
          .timeout(timeoutDuration);

      if (response.statusCode == 200) {
        final decodedResponse = utf8.decode(response.bodyBytes);
        final data = jsonDecode(decodedResponse);
        // TODO: Debugar aqui, pq vai ser atualizado o state com essa receita nova
        return Receita.fromJson(data);
      } else {
        throw Exception('Falha ao atualizar receita: ${response.statusCode}');
      }
    } on TimeoutException {
      throw Exception('A requisição ao servidor excedeu o tempo limite.');
    } catch (error) {
      throw Exception('Erro ao atualizar receita: $error');
    }
  }

  @override
  Future<Receita> criarReceita(Receita receita) async {
    try {
      final url = Uri.parse(urlBackend);
      final body = jsonEncode(receita.toJson());
      final response = await http
          .post(
            url,
            headers: headersBackend,
            body: body,
          )
          .timeout(timeoutDuration);

      if (response.statusCode == 201) {
        final decodedResponse = utf8.decode(response.bodyBytes);
        final data = jsonDecode(decodedResponse);
        // TODO: Debugar aqui, pq vai ser atualizado o state com essa receita nova
        return Receita.fromJson(data);
      } else {
        throw Exception('Falha ao criar receita: ${response.statusCode}');
      }
    } on TimeoutException {
      throw Exception('A requisição ao servidor excedeu o tempo limite.');
    } catch (error) {
      throw Exception('Erro ao criar receita: $error');
    }
  }

  @override
  Future<void> deletarReceita(int id) async {
    try {
      final url = Uri.parse('$urlBackend/$id');
      final response = await http.delete(url).timeout(timeoutDuration);

      if (response.statusCode != 204) {
        throw Exception('Falha ao deletar receita: ${response.statusCode}');
      }
    } on TimeoutException {
      throw Exception('A requisição ao servidor excedeu o tempo limite.');
    } catch (error) {
      throw Exception('Erro ao deletar receita: $error');
    }
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