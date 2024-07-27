import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receitas_de_cafe/enums/loading_states.dart';
import 'package:receitas_de_cafe/models/receita_model.dart';
import 'package:receitas_de_cafe/services/impl/shared_preferences_device_storage_service.dart';
import 'package:receitas_de_cafe/state/formulario_receita_state.dart';
import 'package:receitas_de_cafe/state/formulario_receita_store.dart';
import 'package:receitas_de_cafe/state/info_loading_store.dart';
import 'package:receitas_de_cafe/state/receitas_store.dart';
import 'package:receitas_de_cafe/state/theme_mode_store.dart';

final deviceStoreServiceProvider = Provider((ref) {
  return SharedPreferencesDeviceStorageService();
});

final formProvider =
    StateNotifierProvider<FormularioReceitaStore, FormularioReceitaState>(
  (ref) => FormularioReceitaStore(ref),
);

final themeModeProvider = ChangeNotifierProvider((ref) => ThemeModeStore());

final receitasProvider =
    StateNotifierProvider<ReceitaStore, List<Receita>>((ref) {
  return ReceitaStore(ref);
});

final loadingProvider =
    StateNotifierProvider<InfoLoadingStore, LoadingStates>((ref) {
  return InfoLoadingStore();
});
