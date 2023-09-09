import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_leap/core/data/network/network.dart';
import 'package:learn_leap/core/data/remote/auth/auth.interface.dart';
import 'package:learn_leap/models/create_account_model.dart';
import 'package:learn_leap/core/utils/utils.dart';
import 'package:learn_leap/models/models.dart';

class AuthServiceImpl implements AuthService {
  // ignore: non_constant_identifier_names
  final NAMESPACE = '/authentication';
  final NetworkClient _client = NetworkClient();
  final _logger = appLogger(AuthServiceImpl);
  final _duration = const Duration(seconds: 2);

  @override
  Future<LoginPayload> login(String username, String password) async {
    // await Future.delayed(_duration);
    // final data = LoginPayload(
    //   user: User(
    //       email: 'test@gmail.com',
    //       firstName: 'Collins',
    //       lastName: 'Oriakhi',
    //       role: Role.Student),
    //   token: Token(
    //     token: 'token',
    //     expiration: DateTime.now().add(_duration),
    //   ),
    // );
    final response = await _client.post('$NAMESPACE/login', body: {
      'email': username,
      'password': password,
    });
    _logger.d(response);
    final data = response['data'];
    final payload = LoginPayload.fromMap(data);
    return payload;
    // return data;
    // throw UserDefinedExceptions('Invalid Credenials', 'dccdchdchdhcvdjcjkdcbdhcdjcjddnmcb,djbcjdbhcb');
  }

  @override
  Future<void> logout() async {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> signup(CreateAccount dto) async {
    // final response =
    //     await _client.post("$NAMESPACE/signup", body: dto.toJson());
    // _logger.d(
    //   "Response from SignUp ==> ${response.toString()}",
    // );
    _logger.d("Creating account for ${dto.firstName}");
    await Future.delayed(const Duration(seconds: 3));
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
