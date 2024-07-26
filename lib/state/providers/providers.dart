import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receitas_de_cafe/services/impl/shared_preferences_device_storage_service.dart';
import 'package:receitas_de_cafe/state/formulario_receita_state.dart';
import 'package:receitas_de_cafe/state/formulario_receita_store.dart';
import 'package:receitas_de_cafe/state/theme_mode_store.dart';
import 'package:receitas_de_cafe/state/theme_store.dart';

final deviceStoreServiceProvider = Provider((ref) {
  return SharedPreferencesDeviceStorageService();
});

final formProvider =
    StateNotifierProvider<FormularioReceitaStore, FormularioReceitaState>(
  (ref) => FormularioReceitaStore(),
);

final themeProvider = ChangeNotifierProvider((ref) => ThemeStore());
final themeModeProvider = ChangeNotifierProvider((ref) => ThemeModeStore());
