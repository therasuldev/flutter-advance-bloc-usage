abstract class CacheRepository {
  Future<bool?> put(String key, dynamic value);
  Future<String?> get(String key);
}
