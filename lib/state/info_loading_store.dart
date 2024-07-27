import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receitas_de_cafe/enums/loading_states.dart';

class InfoLoadingStore extends StateNotifier<LoadingStates> {
  InfoLoadingStore() : super(LoadingStates.carregando);

  void setLoading(bool isLoading) {
    state = isLoading ? LoadingStates.carregando : LoadingStates.pronto;
  }

  void setError() {
    state = LoadingStates.erro;
  }
}
