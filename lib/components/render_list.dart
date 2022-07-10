import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertodolist/bloc/todolist_bloc.dart';

class RenderListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodolistBloc, TodolistState>(
      builder: (context, state) {
        if (state is TodoListUpdateState) {
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      height: 40,
                      child: Row(
                        children: [
                          Icon(Icons.check_outlined),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                state.items!.elementAt(index),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              context
                                  .read<TodolistBloc>()
                                  .add(TodolistDeleteEvent(index));
                            },
                            icon: const Icon(Icons.delete),
                          )
                        ],
                      ),
                    );
                  },
                  childCount: state.items!.length,
                ),
              )
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
