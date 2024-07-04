import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/app/models/todo_model.dart';
import 'package:todo/app/ui/widgets/my_drawer.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({required this.title, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> todos = <Todo>[];
  bool _newTodoDone = false;
  late TextEditingController _newTodoController;

  @override
  void initState() {
    super.initState();
    _newTodoController = TextEditingController();
  }

  _addTodo() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicionar Tarefa'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _newTodoController,
                  autofocus: true,
                  decoration: const InputDecoration(hintText: 'Nome da Tarefa'),
                  onChanged: (value) {
                    _newTodoController.text = value;
                  },
                ),
                const SizedBox(height: 20),
                // CupertinoSwitch(
                //   value: _newTodoDone,
                //   onChanged: (bool value) {
                //     setState(() {
                //       _newTodoDone = value;
                //       (context as Element).markNeedsBuild();
                //     });
                //   },
                // ),
                CheckboxListTile(
                  title: const Text('Concluído'),
                  value: _newTodoDone,
                  onChanged: (bool? value) {
                    _newTodoDone = value!;
                    (context as Element).markNeedsBuild();
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Salvar'),
              onPressed: () {
                String newTodoId = Todo.generateUniqueId(todos);
                Todo newTodo = Todo(id: newTodoId, title: _newTodoController.text, done: _newTodoDone);
                print(newTodo.id);
                setState(() {
                  todos.add(newTodo);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(widget.title),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return Dismissible(
                key: Key(todo.id!), // Certifique-se de que cada todo tem um ID único.
                direction: DismissDirection.endToStart, // Permite arrastar apenas da direita para a esquerda.
                onDismissed: (direction) {
                  // Remove o item da lista
                  setState(() {
                    todos.removeAt(index);
                  });

                  // Mostra uma Snackbar ou alguma confirmação de que o item foi excluído, se desejado.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Todo "${todo.title}" removido'),
                    ),
                  );
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                ),
                child: ListTile(
                  title: Text(todo.title),
                  // Adicione aqui outros detalhes do seu Todo, como um ícone de checkbox.
                ),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTodo();
          _newTodoController.clear();
          _newTodoDone = false;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
