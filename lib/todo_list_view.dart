import 'package:flutter/material.dart';

class TodoListView extends StatelessWidget {
  final List<String> items;
  final Function(int) onDismissed;

  const TodoListView({Key? key, required this.items, required this.onDismissed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(items[index]),
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
            onDismissed(index);
          },
          child: Card(child: ListTile(title: Text(items[index]))),
        );
      },
    );
  }
}
