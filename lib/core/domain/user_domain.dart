import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/core.dart';
import 'package:learn_leap/models/models.dart';

class UserDomain {
  final _logger = appLogger(UserDomain);
  final ValueNotifier<User?> _currentUser = ValueNotifier(null);
  ValueNotifier<User?> get currentUser => _currentUser;

  init() {
    _currentUser.value = User(
      email: 'test@gmail.com',
      firstName: 'Collins',
      lastName: 'Oriakhi',
      role: Role.Tutor,
    );
    _logger.d("Current User Info: ${_currentUser.value?.toMap()} ");
  }

  clearUserInfo() async {
    _currentUser.value = null;
  }
}

final userDomainProvider = Provider<UserDomain>((ref) {
  return UserDomain();
});
