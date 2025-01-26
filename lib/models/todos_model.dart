class TodosModel {
  int userId;
  int id;
  String title;

  TodosModel(
      {required this.userId,
        required this.id,
        required this.title,
        });

  TodosModel.fromJson(Map<String, dynamic> json)
      : userId = json["userId"],
        id = json["id"],
        title = json["title"];

  Map<String, dynamic> toJson()=>
      {"userId": userId,"id": id,"title": title,};
}
