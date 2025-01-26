class Album {
  int userId;
  int id;
  String title;


  Album({
    required this.userId,
    required this.id,
    required this.title,

  });

  Album.fromJson(Map<String, dynamic> json)
  : userId = json["alubId"],
  id = json["id"],
  title = json["title"];

  Map<String, dynamic> toJson() =>
      {"albumId": userId,"id":id,"title": title,};
}
