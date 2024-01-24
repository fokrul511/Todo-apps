import 'package:flutter/material.dart';
import 'package:todo_apps/data.dart';

class TodoApps extends StatefulWidget {
  const TodoApps({super.key});

  @override
  State<TodoApps> createState() => _TodoAppsState();
}

class _TodoAppsState extends State<TodoApps> {
  List<TodoListData> todoList = [];
  final TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Todo Apps'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
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
                        validator: (String?value) {

                        },
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Todo',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Add'),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 90,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text('Title'),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete_outline_outlined),
                        ),
                        subtitle: Text('Time'),
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
}
