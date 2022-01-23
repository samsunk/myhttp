import 'package:flutter/material.dart';
import 'package:myhttp/screen/addStudent.dart';
import 'package:myhttp/screen/login.dart';
import 'package:myhttp/screen/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Working with Api',
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/add_student':(context)=>AddStudentScreen()
      },
    );
  }
}
