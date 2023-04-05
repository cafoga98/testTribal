import 'package:pruebatrival/jokers/domain/infrastruture/joker_services.dart';
import 'package:pruebatrival/jokers/domain/models/joker_model.dart';

class JokerRepository {
  JokerRepository();

  Future<List<JokerModel>> getJoker() async {
    List<JokerModel> jokers = [];
    try {
      while(jokers.length <= 20){
        JokerModel jokerModel = await JokerService.fetchJoker();
        jokers.add(jokerModel);
      }
      return jokers;
    } catch (e) {
      rethrow;
    }
  }
}
