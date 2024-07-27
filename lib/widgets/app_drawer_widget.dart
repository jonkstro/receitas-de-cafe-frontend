import 'package:flutter/material.dart';
import 'package:receitas_de_cafe/widgets/alternador_temas_widget.dart';

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Configurações'),
        ),
        AlternadorTemasWidget(),
      ],
    ));
  }
}
