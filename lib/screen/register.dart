import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:myhttp/http/httpuser.dart';
import 'package:myhttp/model/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final regform = GlobalKey<FormState>();
  String fname = '';
  String lname = '';
  String username = '';
  String password = '';

  Future<bool> registerUser(User u) {
    var res = HttpConnectUser().registerPost(u);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: regform,
            child: Column(
              children: [
                TextFormField(
                  onSaved: (value) {
                    fname = value!;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Firstname',
                    hintText: 'Enter your first name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onSaved: (value) {
                    lname = value!;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Lastname',
                    hintText: 'Enter your last name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onSaved: (value) {
                    username = value!;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter your Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onSaved: (value) {
                    password = value!;
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () async {
                    if (regform.currentState!.validate()) {
                      regform.currentState!.save();

                      User u = User(
                          firstname: fname,
                          lastname: lname,
                          username: username,
                          password: password);
                      bool isCreated = await registerUser(u);
                      if (isCreated) {
                        Navigator.pushNamed(context, '/');
                        MotionToast.success(description: 'New user created')
                            .show(context);
                      } else {
                        MotionToast.error(description: 'Failed to create user')
                            .show(context);
                      }
                    }
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
