part of 'todolist_bloc.dart';

@immutable
abstract class TodolistState {}

class TodolistInitial extends TodolistState {}

class TodoListUpdateState extends TodolistState {
  final List<String>? items;

  TodoListUpdateState({required this.items});
}
