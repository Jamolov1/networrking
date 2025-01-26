
import 'dart:convert';

import 'package:http/http.dart';

import '../models/photos_model.dart';

class PhotosService{
  static String BASE = "jsonplaceholder.typicode.com";
  static Map<String, String> headers = {
    "Content-type": "application/json; charset=UTF-8"
  };

    static String apiPhotos = "/photos";
    static String apiPhotosCreate = "/photos";
    static String apiUpdatePhotos = "/photos/";
    static String apiDeletePhotos = "/photos/";

    static Future<String> GET(String api, Map<String,String> params) async {
      var url = Uri.https(BASE,apiPhotos,params);
      var response = await get(url, headers: params);
      if(response.statusCode == 200){
        return response.body;
      }
      return "Xatolik bor";
    }

    static Map<String, String> PhotosParamsEmpty(){
      Map<String, String> params = Map();
      return params;
    }

    static List<Photos> parsePhotosList(String response) {
      dynamic json = jsonDecode(response);
      var data = List<Photos>.from(json.map((element) => Photos.fromJson(element)));
      return data;
    }
}