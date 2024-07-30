import 'package:flutter/material.dart';
import 'package:todo/app/ui/widgets/my_drawer_tile.dart';

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
              MyDrawerTile(
                text: 'Home',
                icon: Icons.home,
                onTap: () {
                  navigateOrCloseDrawer(context);
                },
              ),
              MyDrawerTile(
                text: 'Tarefas concluidas',
                icon: Icons.task,
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
