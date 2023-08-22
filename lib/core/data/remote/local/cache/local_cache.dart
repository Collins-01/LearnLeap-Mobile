import 'package:learn_leap/models/models.dart';

abstract class LocalCache {
  ///Retrieves access token for authorizing requests
  Future<Token?> getToken();

  ///Saves access token for authorizing requests
  Future<void> saveToken(Token token);

  ///Deletes cached access token
  Future<void> deleteToken();

  ///Saves user data
  Future<void> saveUserData(Map<String, dynamic> json);

  ///Retrieves user data
  Map<String, dynamic>? getUserData();

  ///Saves `value` to cache using `key`
  Future<void> saveToLocalCache({
    required String key,
    required dynamic value,
  });

  ///Retrieves a cached value stored with `key`
  Object? getFromLocalCache(String key);

  ///Removes cached value stored with `key` from cache
  Future<void> removeFromLocalCache(String key);

  ///Clears cache
  Future<void> clearCache();
}
