import 'package:bloc/bloc.dart';

class TodocubState {
  final List<String> items;

  TodocubState(this.items);
}

class TodocubCubit extends Cubit<TodocubState> {
  TodocubCubit() : super(TodocubState([]));

  addItem(String item) {
    emit(TodocubState([...state.items, item]));
  }

  deleteItem(int index) {
    state.items.removeAt(index);
    emit(TodocubState(state.items));
  }

  clearList() {
    state.items.clear();
    emit(TodocubState([]));
  }
}
