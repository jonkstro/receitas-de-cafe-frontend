/**
 * 
 * 
 * @override
Widget build(BuildContext context) {
  final formState = ref.watch(formProvider);

  return Scaffold(
    appBar: AppBar(title: Text('Nova Receita')),
    body: formState.isLoading
        ? CircularProgressIndicator()
        : Form(
            child: Column(
              children: [
                TextFormField(
                  initialValue: formState.receita.nome,
                  onChanged: (value) =>
                      ref.read(formProvider.notifier).setNome(value),
                  decoration: InputDecoration(labelText: 'Nome'),
                ),
                // Adicione campos para os outros atributos
                ElevatedButton(
                  onPressed: () =>
                      ref.read(formProvider.notifier).submitForm(),
                  child: Text('Salvar'),
                ),
              ],
            ),
          ),
  );
}
4. Gerenciamento de Estados de Carregamento e Erro:
O exemplo acima já mostra como lidar com estados de carregamento e erro usando o campo isLoading e error no FormState.

Com essa estrutura, você pode gerenciar o estado do seu formulário e lidar com operações assíncronas, como salvar uma receita no backend.
 */