import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/data/network/network.dart';
import 'package:learn_leap/core/data/remote/auth/auth.interface.dart';
import 'package:learn_leap/core/models/create_account_model.dart';
import 'package:learn_leap/core/models/login_payload.dart';
import 'package:learn_leap/utils/utils.dart';

class AuthServiceImpl implements AuthService {
  // ignore: non_constant_identifier_names
  final NAMESPACE = '/authentication';
  final NetworkClient _client = NetworkClient();
  final _logger = appLogger(AuthServiceImpl);

  @override
  Future<LoginPayload> login(String username, String password) async {
    final response = await _client.post('$NAMESPACE/login', body: {
      'email': username,
      'password': password,
    });
    final data = response['data'];
    final payload = LoginPayload.fromMap(data);
    return payload;
  }

  @override
  Future<void> logout() async {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateAccount dto) async {
    final response =
        await _client.post("$NAMESPACE/signup", body: dto.toJson());
    _logger.d(
      "Response from SignUp ==> ${response.toString()}",
    );
  }

  @override
  Future verifyOtp(String email, String code) async {
    final response = await _client
        .post("$NAMESPACE/verify-otp", body: {'email': email, 'code': code});

    _logger.d("Response fromOTP Verification ==>  ${response.toString()}");
  }
}

final authService = Provider<AuthService>((ref) {
  return AuthServiceImpl();
});
