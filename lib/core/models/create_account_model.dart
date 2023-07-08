// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

class CreateAccount {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String role;
  final File avatar;
  CreateAccount({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.role,
    required this.avatar,
  });

  CreateAccount copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? role,
    File? avatar,
  }) {
    return CreateAccount(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'role': role,
      'avatar': avatar,
    };
  }

  String toJson() => json.encode(toMap());
}
