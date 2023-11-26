class Employee {
  String firstName, lastName, email, password, companyName, city,skills;
  int id;
  bool profession;
  Employee(
      {required this.firstName,
      required this.lastName,
      required this.password,
      required this.email,
      required this.companyName,
      required this.city,
      required this.profession,
        required this.skills,
      required this.id});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        firstName: json['firstName'],
        lastName: json['lastName'],
        password: json['password'],
        email: json['password'],
        companyName: json['password'],
        city: json['city'],
        profession: json['profession'],
        skills: json['skills'],
        id: json['_id']);
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "companyName": companyName,
        "city": city,
        "profession": profession,
        "skills":skills
      };
}
