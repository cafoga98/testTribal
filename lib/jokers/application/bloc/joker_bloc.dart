import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '/jokers/application/bloc/joker_events.dart';
import '/jokers/application/bloc/joker_states.dart';
import '/jokers/domain/infrastruture/joker_repository.dart';

class JokerBloc extends Bloc<JokerEvent, JokerStates> {
  final JokerRepository jokerRepository;

  JokerBloc({required this.jokerRepository}) : super(InitState()) {
    on<FetchEvent>(_fetchEvent);
  }

  FutureOr<void> _fetchEvent(FetchEvent event, Emitter<JokerStates> emit) async {
    emit(LoadingState());
    await jokerRepository.getJoker().then((jokers) async {
      emit(DoneState(jokers: jokers));
    }).catchError((e) {
      emit(ErrorState(error: e.toString()));
    });
  }
}
