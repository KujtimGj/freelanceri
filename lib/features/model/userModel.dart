import 'package:mongo_dart/mongo_dart.dart' as M;

class UserModel {
  String firstName, lastName, email, password;

  UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic>? json) {
    return UserModel(
      email: json?['email'] as String? ?? "",
      firstName: json?['firstName'] as String? ?? "",
      lastName: json?['lastName'] as String? ?? "",
      password: json?['password'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      'password': password,
    };
  }

  bool isValid() {
    return email.isNotEmpty &&
        firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        password.isNotEmpty;
  }
}
