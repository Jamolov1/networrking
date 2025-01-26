
import 'dart:convert';

import 'package:http/http.dart';

import '../models/todos_model.dart';


class TodosService{
  static String BASE = "jsonplaceholder.typicode.com";
  static Map<String, String> headers = {
    "Content-type": "application/json; charset=UTF-8"
  };

  static String apiTodos = "/todos";
  static String apiTodosCreate = "/todos";
  static String apiUpdateTodos = "/todos/";
  static String apiDeleteTodos = "/todos/";

  static Future<String> GET(String api, Map<String,String> params) async {
    var url = Uri.https(BASE,apiTodos,params);
    var response = await get(url, headers: params);
    if(response.statusCode == 200){
      return response.body;
    }
    return "Xatolik bor";
  }

  static Map<String, String> TodosParamsEmpty(){
    Map<String, String> params = Map();
    return params;
  }

  static List<TodosModel> parseTodosList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<TodosModel>.from(json.map((element) => TodosModel.fromJson(element)));
    return data;
  }
}