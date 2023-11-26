class Employer {
  String firstName, lastName, email, password, companyName, city;
  int id;
  bool isIndividual;
  Employer(
      {required this.firstName,
      required this.lastName,
      required this.password,
      required this.email,
      required this.companyName,
      required this.city,
      required this.isIndividual,
      required this.id});

  factory Employer.fromJson(Map<String, dynamic> json) {
    return Employer(
        firstName: json['firstName'],
        lastName: json['lastName'],
        password: json['password'],
        email: json['password'],
        companyName: json['password'],
        city: json['city'],
        isIndividual: json['isIndividual'],
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
        "isIndividual": isIndividual
      };
}
