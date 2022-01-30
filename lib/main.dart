import 'package:flutter/material.dart';
import 'package:myhttp/screen/addStudent.dart';
import 'package:myhttp/screen/displayStudent.dart';
import 'package:myhttp/screen/login.dart';
import 'package:myhttp/screen/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Working with Api',
      routes: {
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/add_student': (context) => const AddStudentScreen(),
        '/display_student': (context) => const DisplayStudentScreen()
      },
    );
  }
}
