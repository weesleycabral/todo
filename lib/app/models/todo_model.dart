import 'dart:math';

class Todo {
  String? id;
  String title;
  bool done;
  DateTime? completedDate;

  Todo({required this.id, required this.title, this.done = false, required this.completedDate});

  Map<String, dynamic> toMap() {
    final map = {
      'id': id,
      'title': title,
      'done': done ? 1 : 0,
    };
    map['completedDate'] = completedDate!.toIso8601String();

    return map;
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      done: map['done'] == 1,
      completedDate: map['completedDate'] != null ? DateTime.parse(map['completedDate']) : null,
    );
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
