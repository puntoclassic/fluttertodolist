import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/todocub_cubit.dart';

class ClearListWidget extends StatelessWidget {
  const ClearListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      TextButton(
          onPressed: () {
            context.read<TodocubCubit>().clearList();
          },
          child: const Text("Svuota lista"))
    ]);
  }
}
