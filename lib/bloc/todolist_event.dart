part of 'todolist_bloc.dart';

@immutable
abstract class TodolistEvent {}

class TodolistAddItemEvent extends TodolistEvent {
  final String item;

  TodolistAddItemEvent({required this.item});
}

class TodolistDeleteEvent extends TodolistEvent {
  final int index;

  TodolistDeleteEvent(this.index);
}

class TodolistClearEvent extends TodolistEvent {}
