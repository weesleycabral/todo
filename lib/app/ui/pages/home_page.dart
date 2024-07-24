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
                // CheckboxListTile(
                //   title: const Text('Concluído'),
                //   value: _newTodoDone,
                //   onChanged: (bool? value) {
                //     _newTodoDone = value!;
                //     (context as Element).markNeedsBuild();
                //   },
                // ),
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
              child: const Text('Adicionar'),
              onPressed: () {
                String newTodoId = Todo.generateUniqueId(todos);
                Todo newTodo = Todo(id: newTodoId, title: _newTodoController.text, done: _newTodoDone);
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
        backgroundColor: Colors.blue,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
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
                key: Key(todo.id!),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(() {
                    todos.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Todo "${todo.title}" concluido'),
                    ),
                  );
                },
                background: Container(
                  color: Colors.green,
                  alignment: Alignment.centerRight,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Arraste para concluir',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.done, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeOut,
                  transform: todo.done ? Matrix4.translationValues(MediaQuery.of(context).size.width, 0, 0) : Matrix4.identity(),
                  child: ListTile(
                    title: Text(todo.title),
                    trailing: Checkbox(
                      value: todo.done,
                      onChanged: (bool? value) {
                        setState(() {
                          todo.done = value!;
                          if (todo.done) {
                            Future.delayed(const Duration(milliseconds: 600), () {
                              setState(() {
                                todos.removeAt(index);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text('Todo "${todo.title}" concluido'),
                                ),
                              );
                            });
                          }
                        });
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addTodo();
          _newTodoController.clear();
          _newTodoDone = false;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
