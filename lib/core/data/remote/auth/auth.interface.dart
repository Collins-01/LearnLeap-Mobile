import 'package:learn_leap/models/create_account_model.dart';
import 'package:learn_leap/models/models.dart';

abstract class AuthInterface {
  Future<LoginPayload> login(String username, String password);
  Future<void> signup(CreateAccount dto);
  Future<void> logout();
  Future verifyOtp(String email, String code);
}

abstract class AuthService implements AuthInterface {}

abstract class AuthRepository implements AuthInterface {}
