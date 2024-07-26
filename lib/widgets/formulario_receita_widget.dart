import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormularioReceitaWidget extends ConsumerStatefulWidget {
  const FormularioReceitaWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FormularioReceitaWidgetState();
}

class _FormularioReceitaWidgetState
    extends ConsumerState<FormularioReceitaWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red, child: const Text('TEXTO'));
  }
}
