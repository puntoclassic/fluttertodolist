import 'package:flutter/material.dart';
import 'package:fluttertodolist/components/add_form.dart';

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: const Text("Aggiungi"),
      icon: const Icon(Icons.add),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Container(
                  height: 160,
                  padding: const EdgeInsets.all(16.0),
                  child: const AddFormWidget(),
                ),
              );
            });
      },
    );
  }
}
