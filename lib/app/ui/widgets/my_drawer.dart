import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void navigateOrCloseDrawer(BuildContext context) {
    String? currentRoute = ModalRoute.of(context)?.settings.name;

    if (currentRoute == '/') {
      Navigator.of(context).pop();
    } else {
      Navigator.pushNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  child: Icon(
                    Icons.person,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              ListTile(
                title: const Text('Home'),
                leading: const Icon(Icons.home),
                onTap: () {
                  navigateOrCloseDrawer(context);
                },
              ),
              ListTile(
                title: const Text('Tarefas concluidas'),
                leading: const Icon(Icons.task),
                onTap: () {
                  Navigator.pushNamed(context, '/todosDone');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
