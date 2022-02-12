import 'package:flutter/material.dart';
import 'package:food/pages/cart_page.dart';
import 'package:food/pages/product_datail_page.dart';
import 'package:food/pages/product_page.dart';

import 'myapp.dart';
import 'login.dart';
import 'register.dart';

import 'store/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Fewws());
}

class Fewws extends StatelessWidget {
  const Fewws({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: Home.id,
      routes: {
        Home.id: (context) => Home(),
        Login.id: (context) => Login(),
        Register.id: (context) => Register(),
        MainPage.id:(context)=>MainPage(),
        Product_page.id:(context)=>Product_page(),
        
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const id = 'Home_screen';

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
                Text(
                  'Fews',
                  style: TextStyle(fontSize: 60, color: Colors.lightBlueAccent),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.lightBlueAccent,
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Login.id);
                      
                    },
                    child: Center(
                      child: Text(
                        'Log In',
                        style: TextStyle(),
                      ),
                    ),
                    height: 40,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(30)),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Register.id);
                    },
                    child: Center(
                      child: Text('Register'),
                    ),
                    height: 40,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
