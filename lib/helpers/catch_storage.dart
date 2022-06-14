import 'package:get_storage/get_storage.dart';

class CatchStorage {
  static final _box = GetStorage();

  static Future<void> save(String key, var value) async {
    await _box.write(key, value);
  }

  static dynamic get(String key) {
    return _box.read(key);
  }

  static Future<void> clear() async {
    await _box.erase();
  }

  static Future<void> remove(String key) async {
    await _box.remove(key);
  }
}
