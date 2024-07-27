import 'package:flutter/material.dart';

const String urlBackend = 'http://192.168.1.103:8080/api/receitas';
Map<String, String>? headersBackend = {
  'Content-Type': 'application/json; charset=utf-8',
  'Accept-Encoding': 'gzip, deflate, br',
  'Accept': '*/*'
};

// Constantes de cores:
const surfacePrimaryLight = Color.fromRGBO(251, 247, 222, 1);
const surfacePrimaryDark = Color.fromRGBO(77, 77, 77, 1);
const primaryLight = Color.fromRGBO(110, 100, 2, 1);
const primaryDark = Color.fromRGBO(251, 247, 222, 1);
const secondaryLight = Color.fromRGBO(248, 211, 94, 1);
const secondaryDark = Color.fromRGBO(110, 100, 2, 1);

// Textos
const bodyTextLight = Color.fromRGBO(77, 77, 77, 1);
const bodyTextDark = Color.fromRGBO(255, 255, 255, 1);
