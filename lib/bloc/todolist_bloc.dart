import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todolist_event.dart';
part 'todolist_state.dart';

class TodolistBloc extends Bloc<TodolistEvent, TodolistState> {
  List<String> items = [];

  TodolistBloc() : super(TodolistInitial()) {
    on<TodolistEvent>((event, emit) {
      if (event is TodolistAddItemEvent) {
        items.add(event.item);
        emit(TodoListUpdateState(items: items));
      }

      if (event is TodolistDeleteEvent) {
        items.removeAt(event.index);
        emit(TodoListUpdateState(items: items));
      }

      if (event is TodolistClearEvent) {
        items.clear();
        emit(TodoListUpdateState(items: items));
      }
    });
  }
}
