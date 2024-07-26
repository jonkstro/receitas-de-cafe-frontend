abstract class DeviceStorageService {
  Future<void> setData(String key, String value);
  Future<String?> getData(String key);
  Future<void> removeData(String key);
}
