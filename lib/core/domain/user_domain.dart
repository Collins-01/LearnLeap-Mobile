import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/core.dart';
import 'package:learn_leap/core/data/remote/local/local.dart';
import 'package:learn_leap/models/models.dart';

class UserDomain {
  final _logger = appLogger(UserDomain);
  final LocalCache _cache;
  UserDomain(this._cache);
  final ValueNotifier<User?> _currentUser = ValueNotifier(null);
  ValueNotifier<User?> get currentUser => _currentUser;

  init() async {
    final userData = await _cache.getUserData();
    final tokenInfo = await _cache.getToken();
    _logger.d("User Data:: $userData");
    _logger.d("Token Info:: ${tokenInfo?.toMap()}");
    // await Future.delayed(const Duration(seconds: 1));
    // _currentUser.value = User(
    //   email: 'test@gmail.com',
    //   firstName: 'Collins',
    //   lastName: 'Oriakhi',
    //   role: Role.Student,
    // );
    if (userData != null && tokenInfo != null) {
      final user = User.fromMap(userData);
      _logger.d("User ======${user.toMap()}");
      _logger.d("Current User Info: ${_currentUser.value?.toMap()} ");
    }
    _logger.d("Current User Info: ${_currentUser.value?.toMap()} ");
    return;
  }

  logOut() async {
    _currentUser.value = null;
    await _cache.clearCache();
  }
}

final userDomainProvider = Provider<UserDomain>((ref) {
  return UserDomain(ref.read(localCache));
});
