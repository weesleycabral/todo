import 'package:todo/app/data/database/db.dart';
import 'package:todo/app/models/todo_model.dart';

class TodoRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Todo> todos = [];

  Future<List<Todo>> loadTodos() async {
    return await _databaseHelper.todos();
  }

  Future<void> saveTodo(Todo todo) async {
    await _databaseHelper.insertTodo(todo);
  }

  Future<void> updateTodo(Todo todo) async {
    await _databaseHelper.updateTodo(todo);
  }

  Future<void> deleteTodo(String id) async {
    await _databaseHelper.deleteTodo(id);
  }

  Future<List<Todo>> getLast10CompletedTodos() async {
    List<Todo> completedTodos = todos.where((todo) => todo.done).toList();
    completedTodos.sort((a, b) => b.completedDate!.compareTo(a.completedDate!));
    return completedTodos.take(10).toList();
  }
}
