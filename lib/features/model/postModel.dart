import 'package:mongo_dart/mongo_dart.dart' as M;

class PostModel {
  M.ObjectId id;
  UserId userId;
  String title;
  String description;
  String duration;
  int neededWorkers;
  int budget;
  String city;
  String requirements;
  String postCategory;
  String postCategoryId;
  String experienceLevel;

  PostModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.duration,
    required this.neededWorkers,
    required this.budget,
    required this.city,
    required this.requirements,
    required this.postCategory,
    required this.postCategoryId,
    required this.experienceLevel,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json["_id"] != null ? M.ObjectId.fromHexString(json["_id"]) : M.ObjectId(),
      userId: UserId.fromJson(json["userId"]),
      title: json["title"],
      description: json["description"],
      duration: json["duration"],
      neededWorkers: json["neededWorkers"],
      budget: json["budget"],
      city: json["city"],
      requirements: json["requirements"],
      postCategory: json["postCategory"],
      postCategoryId: json["postCategoryID"],
      experienceLevel: json["experienceLevel"],
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId.toJson(),
    "title": title,
    "description": description,
    "duration": duration,
    "neededWorkers": neededWorkers,
    "budget": budget,
    "city": city,
    "requirements": requirements,
    "postCategory": postCategory,
    "postCategoryID": postCategoryId,
    "experienceLevel": experienceLevel,
  };
}



class UserId {
  M.ObjectId id;
  String firstName;
  String lastName;
  String email;
  String? password;
  String? city;
  String? companyName;
  String? companyType;


  UserId({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.password,
    required this.city,
    this.companyName,
    this.companyType
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    id: json["_id"] != null ? M.ObjectId.fromHexString(json["_id"]) : M.ObjectId(),
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    password: json["password"],
    city: json['city'],
    companyName: json['companyName'],
    companyType: json['companyType']
  );

  Map<String, dynamic> toJson() => {
    "_id": id.toHexString(),
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "password": password,
    "city":city,
    "companyName":companyName,
    'companyType':companyType
  };
}
