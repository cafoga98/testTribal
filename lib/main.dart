import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pruebatrival/jokers/application/bloc/joker_bloc.dart';
import 'package:pruebatrival/jokers/domain/infrastruture/joker_repository.dart';
import 'package:pruebatrival/jokers/presentation/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bromas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<JokerBloc>(
        create: (ctx) => JokerBloc(jokerRepository: JokerRepository()),
        child: const Home(),
      ),
    );
  }
}
