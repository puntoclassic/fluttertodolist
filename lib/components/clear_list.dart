import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertodolist/bloc/todolist_bloc.dart';

class ClearListWidget extends StatelessWidget {
  const ClearListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      TextButton(
          onPressed: () {
            context.read<TodolistBloc>().add(TodolistClearEvent());
          },
          child: const Text("Svuota lista"))
    ]);
  }
}
