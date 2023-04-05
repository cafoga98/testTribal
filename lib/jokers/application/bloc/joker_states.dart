import 'package:pruebatrival/jokers/domain/models/joker_model.dart';

abstract class JokerStates {}

class InitState extends JokerStates {}

class DoneState extends JokerStates {
  List<JokerModel> jokers;

  DoneState({required this.jokers});
}

class ErrorState extends JokerStates {
  String error;

  ErrorState({required this.error});
}

class LoadingState extends JokerStates {}
