import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/data/remote/auth/auth.interface.dart';
import 'package:learn_leap/core/models/create_account_model.dart';
import 'package:learn_leap/core/models/login_payload.dart';

import 'auth.service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;
  AuthRepositoryImpl(this._authService);
  @override
  Future<LoginPayload> login(String username, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateAccount dto) {
    // TODO: implement signup
    throw UnimplementedError();
  }

  @override
  Future verifyOtp(String email, String code) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }
}

final authRepository = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.read(authService));
});
