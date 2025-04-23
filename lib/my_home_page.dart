import 'package:flutter/material.dart';
import 'add_todo_modal.dart';
import 'todo_list_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _items = [
    "サンプルテキスト (1)",
    "サンプルテキスト (2)",
    "サンプルテキスト (3)",
    "サンプルテキスト (4)",
    "サンプルテキスト (5)",
    "サンプルテキスト (6)",
    "サンプルテキスト (7)",
    "サンプルテキスト (8)",
    "サンプルテキスト (9)",
    "サンプルテキスト (10)",
  ];
  final TextEditingController _textFieldController = TextEditingController();

  void _addTodo(String text) {
    setState(() {
      _items.add(text);
    });
  }

  void _removeTodo(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: TodoListView(items: _items, onDismissed: _removeTodo),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return AddTodoModal(
                textFieldController: _textFieldController,
                addTodo: _addTodo,
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
