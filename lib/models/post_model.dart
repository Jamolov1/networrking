class Post {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Post({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body
  });

  Post.fromJson(Map<String, dynamic> json)
  :postId = json["postId"],
  id = json["id"],
  name = json["name"],
  email = json["email"],
  body = json["body"];

  Map<String, dynamic> toJson()=>
      {"postID": postId, "id": id, "name": name,"email": email,"body": body};
}