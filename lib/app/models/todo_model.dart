import 'dart:math';

class Todo {
  String? id;
  String title;
  bool done;
  DateTime completedDate;

  Todo({required this.id, required this.title, this.done = false, required this.completedDate});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'done': done ? 1 : 0, 'completedDate': completedDate.toIso8601String()};
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(id: map['id'], title: map['title'], done: map['done'] == 1, completedDate: DateTime.now());
  }

  static String generateUniqueId(List<Todo> todos) {
    final random = Random();
    String generatedId;

    do {
      generatedId = random.nextInt(10000).toString();
    } while (todos.any((todo) => todo.id == generatedId));

    return generatedId;
  }
}
