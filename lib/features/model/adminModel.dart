import 'package:Freelanceri/features/model/userModel.dart';

class Admin {
  int role;
  String id;
  UserModel user;

  Admin(
      {required this.id,required this.role,required this.user});

  factory Admin.fromJson(Map<String,dynamic>json){
    return Admin(
        id: json['_id'],
        role: json['role'],
        user: json['user']
    );
  }

  Map<String, dynamic> toJson()=>{
    "_id":id,
    "role":role,
    'user':user,
  };
}
