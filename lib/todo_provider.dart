import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_list_demo/todo.dart';

final todoListProvider =
    StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  return TodoListNotifier();
});

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super([]);

  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  void removeTodo(int id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  void toggleCompleted(int id) {
    state = state
        .map((todo) => Todo(
              id: todo.id,
              content: todo.content,
              completed: (id != todo.id) ? todo.completed : !todo.completed,
            ))
        .toList();
  }
}
