
import 'dart:convert';

import 'package:http/http.dart';

import '../models/album_model.dart';



class AlbumService{
  static String BASE = "jsonplaceholder.typicode.com";
  static Map<String, String> headers = {
    "Content-type": "application/json; charset=UTF-8"
  };

  // Album
  static String apiAlbum = "/photos";
  static String apiAlbumCreate =  "/photos";
  static String apiUpdateAlbum= "/photos/";
  static String apiDeleteAlbum = "/photos/";

  static Future<String> GET(String api, Map<String, String> params) async {
    var url = Uri.https(BASE,apiAlbum, params);
    var response = await get(url,headers: params);
    if(response.statusCode == 200){
      return response.body;
    }
    return "Xatolik bor";
  }

  static Map<String, String> albumParamsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  static List<Album> parseAlbumList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Album>.from(json.map((element) => Album.fromJson(element)));
    return data;
  }
}