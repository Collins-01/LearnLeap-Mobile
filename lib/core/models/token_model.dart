// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Token {
  final String token;
  final DateTime expiration;
  Token({
    required this.token,
    required this.expiration,
  });

  Token copyWith({
    String? token,
    DateTime? expiration,
  }) {
    return Token(
      token: token ?? this.token,
      expiration: expiration ?? this.expiration,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'expiration': expiration.millisecondsSinceEpoch,
    };
  }

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(
      token: map['token'] as String,
      expiration: DateTime.fromMillisecondsSinceEpoch(map['expiration'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Token.fromJson(String source) =>
      Token.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Token(token: $token, expiration: $expiration)';

  @override
  bool operator ==(covariant Token other) {
    if (identical(this, other)) return true;

    return other.token == token && other.expiration == expiration;
  }

  @override
  int get hashCode => token.hashCode ^ expiration.hashCode;
}
