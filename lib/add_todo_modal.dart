import 'package:flutter/material.dart';

class AddTodoModal extends StatelessWidget {
  final TextEditingController textFieldController;
  final Function(String) addTodo;

  const AddTodoModal({
    Key? key,
    required this.textFieldController,
    required this.addTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: textFieldController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'テキスト',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (textFieldController.text.isNotEmpty) {
                addTodo(textFieldController.text);
                textFieldController.clear();
                Navigator.pop(context);
              }
            },
            child: const Text('登録'),
          ),
        ],
      ),
    );
  }
}
