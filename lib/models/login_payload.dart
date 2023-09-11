// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:learn_leap/models/models.dart';

// To parse this JSON data, do
//
//     final loginPayload = loginPayloadFromMap(jsonString);

LoginPayload loginPayloadFromMap(String str) =>
    LoginPayload.fromMap(json.decode(str));

String loginPayloadToMap(LoginPayload data) => json.encode(data.toMap());

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
  }) =>
      LoginPayload(
        user: user ?? this.user,
        token: token ?? this.token,
      );

  factory LoginPayload.fromMap(Map<String, dynamic> json) => LoginPayload(
        user: User.fromMap(json["user"]),
        token: Token.fromMap(json["token"]),
      );

  Map<String, dynamic> toMap() => {
        "user": user.toMap(),
        "token": token.toMap(),
      };
}
