import 'package:flutter/material.dart';
import 'package:app_todo_jr/todo_list_page.dart';

class AppTodo extends StatelessWidget {
  const AppTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: TodoListPage(),
    );
  }
}
