import 'package:flutter/material.dart';
import 'package:todo_apps/add_new_todo_screen.dart';
import 'package:todo_apps/todo.dart';
import 'package:intl/intl.dart';

import 'edit_todo_screen.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: Visibility(
        visible: todoList.isNotEmpty,
        replacement: Center(
          child: Text('Todo List Empty'),
        ),
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(thickness: 2),
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todoList[index].title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(todoList[index].discription),
                  Text(DateFormat.yMEd()
                      .add_jms()
                      .format(todoList[index].dateTime)),
                ],
              ),
              trailing: Wrap(
                children: [
                  IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return buildAlertDialog(context, index);
                          },
                        );
                      },
                      icon: const Icon(Icons.delete_outline_outlined)),
                  IconButton(
                      onPressed: () async {
                        final Todo? updatedTodo = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditTodoScreen(todo: todoList[index]),
                          ),
                        );
                        if (updatedTodo != null) {
                          todoList[index] = updatedTodo;
                          setState(() {});
                        }
                      },
                      icon: const Icon(Icons.edit)),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Todo? result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNewTodoScreen(),
            ),
          );
          if (result != null) {
            todoList.add(result);
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  AlertDialog buildAlertDialog(BuildContext context, int index) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text('Delete Todo'),
      content: const Text('Are you sure you want to Delete ?'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel')),
        TextButton(
          onPressed: () {
            todoList.removeAt(index);
            Navigator.pop(context);
            setState(() {});
          },
          style: TextButton.styleFrom(foregroundColor: Colors.orange),
          child: const Text('Yes,delete'),
        ),
      ],
    );
  }
}
