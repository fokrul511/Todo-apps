import 'package:flutter/material.dart';
import 'package:todo_apps/todo_apps.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent)),
          enabledBorder: OutlineInputBorder(),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            padding: EdgeInsets.symmetric(vertical: 19),
          ),
        ),
      ),
      home: const TodoApps(),
    );
  }
}
