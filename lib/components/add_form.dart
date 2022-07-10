import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertodolist/bloc/todolist_bloc.dart';

class AddFormWidget extends StatefulWidget {
  @override
  State<AddFormWidget> createState() => _AddFormWidgetState();
}

class _AddFormWidgetState extends State<AddFormWidget> {
  final textController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextFormField(
            controller: textController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Inserisci un valore";
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context
                        .read<TodolistBloc>()
                        .add(TodolistAddItemEvent(item: textController.text));
                    setState(() {
                      textController.clear();
                    });
                  }
                },
                child: const Text("Aggiungi")),
          )
        ],
      ),
    );
  }
}
