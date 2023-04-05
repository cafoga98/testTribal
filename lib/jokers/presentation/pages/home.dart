import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/jokers/application/bloc/joker_bloc.dart';
import '/jokers/application/bloc/joker_events.dart';
import '/jokers/application/bloc/joker_states.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<JokerBloc, JokerStates>(builder: (context, state) {
            if (state is DoneState) {
              return ListView.separated(
                itemCount: state.jokers.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text("${index+1}. ${state.jokers[index].value}" ?? "No hay broma"),
                  );
                },
              );
            } else if (state is ErrorState) {
              return Center(
                child: Text(state.error),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<JokerBloc>().add(FetchEvent());
  }
}
