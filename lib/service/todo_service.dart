

import 'dart:convert';

import 'package:ders/constans/constans.dart';
import 'package:ders/model/model.dart';
import 'package:http/http.dart' as http;
class ApiService {
  
  Future<List<GetModel>> getTodos()  async{
    final response = await http.get(Uri.parse(url));
    List<GetModel> comments = [];

    List<dynamic> responseList = jsonDecode(response.body);

    for (var i = 0; i < responseList.length; i++) {
      comments.add(GetModel.fromJson(responseList[i]));
    }

    return comments;
  }
  Future<http.Response> postTodos(GetModel model) async {
    final response =await http.post(Uri.parse(url),
    headers: <String,String>{
      "Content-Type":"application/json charset=UTF-8 ",

    },
    body: jsonEncode(model.toJson()),
    );
    
    return response;
    
  }
}