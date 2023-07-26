import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/data/remote/auth/auth.interface.dart';
import 'package:learn_leap/core/data/remote/local/local.dart';
import 'package:learn_leap/core/models/create_account_model.dart';
import 'package:learn_leap/core/models/login_payload.dart';

import 'auth.service.dart';

class AuthRepositoryImpl implements AuthRepository {
  late final AuthService _authService;
  late final LocalCache _localCache;
  AuthRepositoryImpl(this._authService, this._localCache);
  @override
  Future<LoginPayload> login(String username, String password) async {
    final response = await _authService.login(username, password);
    await _localCache.saveToken(response.token);
    await _localCache.saveUserData(response.user.toMap());
    return response;
  }

  @override
  Future<void> logout() async {
    await _authService.logout();
  }

  @override
  Future<void> signup(CreateAccount dto) async {
    return await _authService.signup(dto);
  }

  @override
  Future verifyOtp(String email, String code) async {
    return await _authService.verifyOtp(email, code);
  }
}

final authRepository = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.read(authService), ref.read(localCache));
});
