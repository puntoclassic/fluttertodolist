import 'package:bloc/bloc.dart';

class TodolistCubitState {
  final List<String> items;

  TodolistCubitState(this.items);
}

class TodolistCubit extends Cubit<TodolistCubitState> {
  TodolistCubit() : super(TodolistCubitState([]));

  addItem(String item) {
    emit(TodolistCubitState([...state.items, item]));
  }

  deleteItem(int index) {
    state.items.removeAt(index);
    emit(TodolistCubitState(state.items));
  }

  clearList() {
    state.items.clear();
    emit(TodolistCubitState([]));
  }
}
