
class PostModel {
  dynamic id,image;
  String title,
      description,
      requirements,
      city,
      postCategory,
      postCategoryID,
      userId,
      experienceLevel,
      duration;
  int neededWorkers,
      budget;

  PostModel({
    required this.id,
    required this.title,
    required this.description,
    required this.duration,
    required this.neededWorkers,
    required this.budget,
    required this.city,
    required this.requirements,
    required this.experienceLevel,
    required this.postCategory,
    required this.postCategoryID,
    required this.userId,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['_id'] ?? "",
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      duration: json['duration'] ?? "",
      neededWorkers: int.parse(json['neededWorkers'].toString() ?? ""),
      budget: int.parse(json['budget'].toString() ?? ""),
      city: json['city'] ?? "",
      requirements: json['requirements'] ?? "",
      experienceLevel: json['experienceLevel'] ?? "",
      postCategory: json['postCategory'] ?? "",
      postCategoryID: json['postCategoryId'] ?? "",
      userId: json['userId'] ?? "",
    );
  }
  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "duration": duration,
        "neededWorkers": neededWorkers,
        "budget": budget,
        "city": city,
        "requirements": requirements,
        "experienceLevel": experienceLevel,
        "postCategory": postCategory,
        "postCategoryID": postCategoryID,
        "userId": userId,
      };
}
List<PostModel> postModel=[
  PostModel(
      id: "1",
      title: "Nevojitet web zhvillues - WordPress",
      description: "Po kërkoj një zhvillues web të kualifikuar për të ndihmuar në krijimin e një faqeje të internetit me përdorim të platformës WordPress. Duhet të keni njohuri të thella të WordPress, HTML, dhe CSS. Përvoja në integrimin e funksionaliteteve të ndryshme dhe një portofol të pasur janë avantazhe. Pagesa bazohet në projekt, buxheti fillon nga \$500. Nëse keni aftësitë e nevojshme dhe jeni të interesuar, ju lutem reagoni me disa nga punët tuaja të mëparshme dhe përshkrimin e shkurtër të aftësive tuaja në WordPress.",
      duration: "1 muaj",
      neededWorkers: 3,
      budget: 1800,
      city: "Prishtina",
      requirements: "Aftësi të shkelqyeshme me Wordpress, PHP dhe MySQL.",
      experienceLevel: "Profesional",
      postCategory: "Dizajn Grafik",
      postCategoryID: "10",
      userId: "1203adasd",
  ),
  PostModel(
      id: "1",
      title: "Nevojitet dizajner kreativ grafik",
      description: "Kërkoj një dizajner grafik të talentuar për të krijuar një logo unike dhe tërheqëse për startup-in tim. Përvoja në profesion dhe një portofolio e fortë janë një domosdoshmëri.",
      duration: "16 ditë",
      neededWorkers: 2,
      budget: 900,
      city: "Prishtina",
      requirements: "Aftësi të shkelqyeshme me Adobe Illustrator, Adobe Photoshop dhe Figma në dizajnim te web-faqeve",
      experienceLevel: "Profesional",
      postCategory: "Dizajn Grafik",
      postCategoryID: "10",
      userId: "1203adasd",
  ),
];