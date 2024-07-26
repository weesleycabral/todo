import 'package:flutter/material.dart';
import 'package:todo/app/data/repositories/todo_repository.dart';
import 'package:todo/app/models/todo_model.dart';

class TodosDonePage extends StatefulWidget {
  const TodosDonePage({super.key});

  @override
  _TodosDonePageState createState() => _TodosDonePageState();
}

class _TodosDonePageState extends State<TodosDonePage> {
  List<Todo> completedTodos = [];

  @override
  void initState() {
    super.initState();
    _loadCompletedTodos();
  }

  Future<void> _loadCompletedTodos() async {
    final todos = await TodoRepository().getLast10CompletedTodos();
    setState(() {
      completedTodos = todos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Últimas Tarefas Concluídas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: completedTodos.length,
        itemBuilder: (context, index) {
          final todo = completedTodos[index];
          return ListTile(
            title: Text(todo.title),
            subtitle: Text('Concluído em: ${todo.completedDate}'),
          );
        },
      ),
    );
  }
}
