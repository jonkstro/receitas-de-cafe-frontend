import 'package:receitas_de_cafe/enums/dificuldade_preparo.dart';

class Receita {
  int id;
  String nome;
  String descricao;
  Set<String> ingredientes;
  Set<String> instrucoes;
  int tempoPreparo;
  DificuldadePreparo dificuldade;
  String imagemBase64;
  DateTime createdAt;

  Receita({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.ingredientes,
    required this.instrucoes,
    required this.tempoPreparo,
    required this.dificuldade,
    required this.imagemBase64,
    required this.createdAt,
  });

  factory Receita.fromJson(Map<String, dynamic> json) {
    return Receita(
      id: json['id'],
      nome: json['nome'],
      descricao: json['descricao'],
      ingredientes: Set<String>.from(json['ingredientes']),
      instrucoes: Set<String>.from(json['instrucoes']),
      tempoPreparo: json['tempoPreparo'],
      dificuldade: DificuldadePreparo.values
          .firstWhere((e) => e.name.toUpperCase() == json['dificuldade']),
      imagemBase64: json['imagemBase64'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'ingredientes': ingredientes.toList(),
      'instrucoes': instrucoes.toList(),
      'tempoPreparo': tempoPreparo,
      'dificuldade': dificuldade.name.toUpperCase(),
      'imagemBase64': imagemBase64,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  Receita copyWith(
      {String? nome,
      String? descricao,
      Set<String>? ingredientes,
      Set<String>? instrucoes,
      int? tempoPreparo,
      DificuldadePreparo? dificuldade,
      String? imagemBase64}) {
    return Receita(
        id: id,
        nome: nome ?? this.nome,
        descricao: descricao ?? this.descricao,
        ingredientes: ingredientes ?? this.ingredientes,
        instrucoes: instrucoes ?? this.instrucoes,
        tempoPreparo: tempoPreparo ?? this.tempoPreparo,
        dificuldade: dificuldade ?? this.dificuldade,
        imagemBase64: imagemBase64 ?? this.imagemBase64,
        createdAt: createdAt);
  }
}
