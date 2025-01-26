
import 'dart:convert';

import 'package:http/http.dart';
import 'package:networrking/models/product_model.dart';

import '../models/valyuta_model.dart';


class ProductService{
  static String BASE = "https://fakestoreapi.com/products";
  static Map<String, String> headers = {
    "Content-type": "application/json; charset=UTF-8"
  };


  static String apiAlbum = "";
  static String apiAlbumCreate =  "";
  static String apiUpdateAlbum= "";
  static String apiDeleteAlbum = "";

  static Future<String> GET() async {
    var url = Uri.parse(BASE,);
    var response = await get(url);
    if(response.statusCode == 200){
      return response.body;
    }
    return "Xatolik bor";
  }

  static Map<String, String> usersParamsEmpty() {
    Map<String, String> params = Map();
    return params;
  }

  static List<ProductModel> parseUsersList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<ProductModel>.from(json.map((element) => ProductModel.fromJson(element)));
    return data;
  }
}