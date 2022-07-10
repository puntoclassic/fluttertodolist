import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertodolist/cubit/todocub_cubit.dart';

class RenderListWidget extends StatelessWidget {
  const RenderListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodolistCubit, TodolistCubitState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        const Icon(Icons.check_outlined),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              state.items.elementAt(index),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<TodolistCubit>().deleteItem(index);
                          },
                          icon: const Icon(Icons.delete),
                        )
                      ],
                    ),
                  );
                },
                childCount: state.items.length,
              ),
            )
          ],
        );
      },
    );
  }
}
