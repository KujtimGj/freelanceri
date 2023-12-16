import 'package:mongo_dart/mongo_dart.dart' as M;

class UserModel {
  String firstName, lastName, email, password,city,profession;
  M.ObjectId id;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.city,
    required this.profession
  });

  factory UserModel.fromJson(Map<String, dynamic>? json) {
    return UserModel(
      id: json?['_id'] != null ? M.ObjectId.parse(json!['_id']) : M.ObjectId(),
      email: json?['email'] as String? ?? "",
      firstName: json?['firstName'] as String? ?? "",
      lastName: json?['lastName'] as String? ?? "",
      password: json?['password'] as String? ?? "",
      city:json?['city'] as String? ?? "",
      profession:json?['profession'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id":id,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      'password': password,
      'city':city,
      'profession':profession
    };
  }

  bool isValid() {
    return email.isNotEmpty &&
        firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        password.isNotEmpty &&
        city.isNotEmpty &&
        profession.isNotEmpty;
  }
}
