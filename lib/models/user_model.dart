// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


enum Role {
  Student,
  Tutor
}

extension RoleExtension on Role {
  bool get isStudent => this==Role.Student;
  bool get isTutor=> this==Role.Tutor;
}
class User {
  final String email;
  final String firstName;
  final String lastName;
  final Role role;
  User({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
  });

  User copyWith({
    String? email,
    String? firstName,
    String? lastName,
    Role? role,
  }) {
    return User(
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'role': role.name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      role: _roleFromMap(map['role'] as String )
    );
    
  }

  static Role _roleFromMap(String value){
    if(value =='student'){
      return Role.Student;
    }
    else if (value == 'tutor'){
      return Role.Student;
    }
    else {
      throw UnsupportedError('Role ${value} not supported');
    }
    
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(email: $email, firstName: $firstName, lastName: $lastName, role: $role)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.email == email &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.role == role;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        role.hashCode;
  }
}
