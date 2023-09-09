// ignore_for_file: public_member_api_docs, sort_constructors_first

enum Role {
  // ignore: constant_identifier_names
  Student,
  // ignore: constant_identifier_names
  Tutor
}

extension RoleExtension on Role {
  bool get isStudent => this == Role.Student;
  bool get isTutor => this == Role.Tutor;
}

class User {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final Role role;
  final bool isVerified;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
  });

  User copyWith({
    String? id,
    String? email,
    String? firstName,
    String? lastName,
    Role? role,
    bool? isVerified,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      User(
        id: id ?? this.id,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        role: role ?? this.role,
        isVerified: isVerified ?? this.isVerified,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["_id"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        role: _roleFromMap(json["role"]),
        isVerified: json["isVerified"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  static Role _roleFromMap(String value) {
    if (value == 'student') {
      return Role.Student;
    } else if (value == 'tutor') {
      return Role.Student;
    } else {
      throw UnsupportedError('Role $value not supported');
    }
  }

  Map<String, dynamic> toMap() => {
        "_id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "role": role.name,
        "isVerified": isVerified,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
