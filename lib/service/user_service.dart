
import 'dart:convert';

import 'package:http/http.dart';

import '../models/user_model.dart';


class UserService{
  static String BASE = "jsonplaceholder.typicode.com";
  static Map<String, String> headers = {
    "Content-type": "application/json; charset=UTF-8"
  };

  // Album
  static String apiAlbum = "/users";
  static String apiAlbumCreate =  "/users";
  static String apiUpdateAlbum= "/users/";
  static String apiDeleteAlbum = "/users/";

  static Future<String> GET(String api, Map<String, String> params) async {
    var url = Uri.https(BASE,apiAlbum, params);
    var response = await get(url,headers: params);
    if(response.statusCode == 200){
      return response.body;
    }
    return "Xatolik bor";
  }

  static Map<String, String> usersParamsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  static List<UserModel> parseUsersList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<UserModel>.from(json.map((element) => UserModel.fromJson(element)));
    return data;
  }
}