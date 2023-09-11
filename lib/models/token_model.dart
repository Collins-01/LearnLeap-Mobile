class Token {
  final String token;
  final int expiry;

  Token({
    required this.token,
    required this.expiry,
  });

  Token copyWith({
    String? token,
    int? expiry,
  }) =>
      Token(
        token: token ?? this.token,
        expiry: expiry ?? this.expiry,
      );

  factory Token.fromMap(Map<String, dynamic> json) => Token(
        token: json["token"],
        expiry: json["expiry"],
      );

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        token: json["token"],
        expiry: json["expiry"],
      );

  Map<String, dynamic> toMap() => {
        "token": token,
        "expiry": expiry,
      };
}
