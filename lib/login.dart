import 'package:flutter/material.dart';
import 'package:food/myapp.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const id = 'Login_screen';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(),
                TextField(),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MainPage.id);
                  },
                  color: Colors.blue,
                  child: Center(
                    child: Text('Log In'),
                  ),
                  height: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
