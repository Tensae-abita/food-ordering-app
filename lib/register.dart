import 'package:flutter/material.dart';
import 'myapp.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  static const id = 'register_screen';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                    child: Text('Register'),
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
