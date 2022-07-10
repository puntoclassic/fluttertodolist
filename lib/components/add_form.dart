import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertodolist/cubit/todocub_cubit.dart';

class AddFormWidget extends StatefulWidget {
  const AddFormWidget({Key? key}) : super(key: key);

  @override
  State<AddFormWidget> createState() => _AddFormWidgetState();
}

class _AddFormWidgetState extends State<AddFormWidget> {
  final textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextFormField(
            controller: textController,
            decoration: const InputDecoration(
              label: Text("Inserisci una descrizione"),
            ),
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
                    context.read<TodolistCubit>().addItem(textController.text);
                    setState(() {
                      textController.clear();
                    });
                    Navigator.of(context).pop();
                  }
                },
                child: const Text("Aggiungi")),
          )
        ],
      ),
    );
  }
}
