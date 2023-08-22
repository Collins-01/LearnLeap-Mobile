// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:learn_leap/models/models.dart';

class LoginPayload {
  final User user;
  final Token token;
  LoginPayload({
    required this.user,
    required this.token,
  });

  LoginPayload copyWith({
    User? user,
    Token? token,
  }) {
    return LoginPayload(
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
      'token': token.toMap(),
    };
  }

  factory LoginPayload.fromMap(Map<String, dynamic> map) {
    return LoginPayload(
      user: User.fromMap(map['user'] as Map<String, dynamic>),
      token: Token.fromMap(map['token'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginPayload.fromJson(String source) =>
      LoginPayload.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginPayload(user: $user, token: $token)';

  @override
  bool operator ==(covariant LoginPayload other) {
    if (identical(this, other)) return true;

    return other.user == user && other.token == token;
  }

  @override
  int get hashCode => user.hashCode ^ token.hashCode;
}
