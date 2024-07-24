import 'dart:math';

class Todo {
  String? id;
  String title;
  bool done;

  Todo({
    required this.id,
    required this.title,
    this.done = false,
  });

  static String generateUniqueId(List<Todo> todos) {
    final random = Random();
    String generatedId;

    do {
      generatedId = random.nextInt(10000).toString();
    } while (todos.any((todo) => todo.id == generatedId));

    return generatedId;
  }
}
