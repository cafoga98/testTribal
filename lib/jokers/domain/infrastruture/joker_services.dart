import 'dart:convert';

import 'package:http/http.dart' as http;

import '/jokers/domain/models/joker_model.dart';

class JokerService {

  static Future<JokerModel> fetchJoker() async {
    try{
      final response =
      await http.get(Uri.parse('https://api.chucknorris.io/jokes/random'));

      switch(response.statusCode){
        case 200:
          return JokerModel.fromJson(json.decode(response.body));
        default:
          return throw Exception('No es una buena peticion');
      }
    }catch(e){
      rethrow;
    }
  }
}
