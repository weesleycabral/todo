import 'package:flutter/material.dart';
import 'package:todo/app/ui/pages/home_page.dart';
import 'package:todo/app/ui/pages/todos_done.dart';

class Routes extends StatefulWidget {
  const Routes({super.key});

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      title: 'TODO List',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(
              title: 'Lista de Tarefas',
            ),
        '/todosDone': (context) => const TodosDonePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
