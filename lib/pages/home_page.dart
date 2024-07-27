import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receitas_de_cafe/enums/loading_states.dart';
import 'package:receitas_de_cafe/pages/lista_receitas_page.dart';
import 'package:receitas_de_cafe/state/providers/providers.dart';
import 'package:receitas_de_cafe/widgets/app_drawer_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(receitasProvider.notifier).carregarReceitas();
    });
  }

  @override
  Widget build(BuildContext context) {
    final loadingState = ref.watch(loadingProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Receitas de Café'),
        ),
        drawer: const AppDrawerWidget(),
        body: Center(
          child: loadingState == LoadingStates.erro
              ? Text(
                  'Erro ao carregar dados.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.red),
                )
              : loadingState == LoadingStates.pronto
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Selecione o que deseja:',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ListaReceitasPage(),
                            ));
                          },
                          child: const Text('LISTAR MINHAS RECEITAS'),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('CADASTRAR NOVA RECEITA'),
                        ),
                      ],
                    )
                  : const CircularProgressIndicator(),
        ));
  }
}
