import 'package:receitas_de_cafe/services/device_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDeviceStorageService implements DeviceStorageService {
  @override
  Future<String?> getData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // atualizar para evitar dados cacheados
    await prefs.reload();
    return prefs.getString(key);
  }

  @override
  Future<void> removeData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  @override
  Future<void> setData(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
}
