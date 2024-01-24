import 'package:flutter/material.dart';
import 'package:todo_apps/data.dart';
import 'package:intl/intl.dart';

class TodoApps extends StatefulWidget {
  const TodoApps({super.key});

  @override
  State<TodoApps> createState() => _TodoAppsState();
}

class _TodoAppsState extends State<TodoApps> {
  List<TodoListData> todoList = [];
  final TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  mySnakeBar(String title) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(title)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Todo Apps'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return 'Enter text';
                          }
                          return null;
                        },
                        controller: _textEditingController,
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Todo',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_globalKey.currentState!.validate()) {
                            todoList.insert(
                                0,
                                TodoListData(
                                    title: _textEditingController.text,
                                    time: DateTime.now()));

                            _textEditingController.clear();
                            setState(() {});
                          }
                        },
                        child: const Text('Add'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 90,
                child: ListView.builder(
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(todoList[index].title),
                        trailing: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Deleate'),
                                  content:
                                      const Text('are your sure you want to delete?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        todoList.remove(todoList[index]);

                                        Navigator.pop(context);
                                        setState(() {});
                                      },
                                      child: const Text('Yes, Delete'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.delete_outline_outlined,
                            color: Colors.orange,
                          ),
                        ),
                        subtitle: Text(DateFormat.yMEd()
                            .add_jms()
                            .format(todoList[index].time)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
