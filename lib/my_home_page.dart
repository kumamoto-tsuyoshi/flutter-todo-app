import 'package:flutter/material.dart';
import 'add_todo_modal.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(_items[index]),
            direction: DismissDirection.startToEnd,
            background: Container(
              color: Colors.red,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                _items.removeAt(index);
              });
            },
            child: Card(child: ListTile(title: Text(_items[index]))),
          );
        },
      ),
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
