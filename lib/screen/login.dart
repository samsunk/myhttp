import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:myhttp/http/httpuser.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginform = GlobalKey<FormState>();
  final lgController = TextEditingController()..text = 'shyam123';
  final passController = TextEditingController()..text = 'shyam123';

  String uname = '';
  String pass = '';

  Future<bool> loginPost(String uname, String pass) {
    var res = HttpConnectUser().loginPosts(uname, pass);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: loginform,
            child: Column(
              children: [
                Image.asset(
                  'images/micky.jpeg',
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: lgController,
                  onSaved: (value) {
                    uname = value!;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: passController,
                  onSaved: (newValue) {
                    pass = newValue!;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () async {
                    loginform.currentState!.save();
                    var res = await loginPost(uname, pass);
                    if (res) {
                      Navigator.pushNamed(context, '/add_student');
                      MotionToast.success(
                        description: 'Login Successfull',
                        toastDuration: const Duration(seconds: 1),
                      ).show(context);
                    } else {
                      MotionToast.success(description: 'Login UnSuccessfull')
                          .show(context);
                    }
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(height: 30),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: RichText(
                      text: const TextSpan(children: [
                    TextSpan(
                      text: 'New User???',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        // ,
                      ),
                    ),
                    TextSpan(
                      text: '  Sign Up!!!',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.red,
                        // decoration: TextDecoration.underline,
                        // decorationThickness: 2,
                      ),
                    ),
                  ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
