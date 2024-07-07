import 'package:first_flutter_project/core/service/local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheRepositoryImpl implements CacheRepository {
  late Future<SharedPreferences> preferences;

  CacheRepositoryImpl() {
    preferences = SharedPreferences.getInstance();
  }

  @override
  Future<String?> get(String key) async {
    return (await preferences).getString(key);
  }

  @override
  Future<bool?> put(String key, dynamic value) async {
    return (await preferences).setString(key, value);
  }
}
