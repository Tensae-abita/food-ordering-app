import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food/pages/components/order_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'constants.dart';
import 'main_page.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  static const id = 'register_screen';
  

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;
  var email;
  var password;
   bool loading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: loading,
          child: Container(
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //       image: AssetImage("images/back.jpg"), fit: BoxFit.cover),
              // ),
              child: ListView(children: <Widget>[
            Column(
              children: [
                const Text(
                  'Register',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff032A49)),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffEEEEEE).withOpacity(0.9),
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      inputFeild(
                        hint: 'Enter your First Name',
                      ),
                      inputFeild(
                        hint: 'Enter your last Name',
                      ),
                      inputFeild(
                        hint: 'Enter your E-mail',
                        press:  (value) {
                      //Do something with the user input.
                      email = value;
                    },
                      ),
                      inputFeild(
                        hint: 'Enter Password',
                        press: (value) {
                      //Do something with the user input.
                      password = value;
                    },
                      ),
                      inputFeild(
                        hint: 'Re-Enter Password',
                      ),
                      OrderButton(
                          size: size,
                          press: () async {
                      setState(() {
                        loading = true;
                      });
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        Navigator.pushNamed(context, MainPage.id);
                        setState(() {
                          loading = false;
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                          Button_Name: "REGISTER"),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(children: const <Widget>[
                        Expanded(
                            child: Divider(
                          color: Colors.black,
                        )),
                        SizedBox(
                          width: 5,
                        ),
                        Text("OR"),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Divider(
                          color: Colors.black,
                        )),
                      ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('images/facebookk.png'),
                              )),
                          const SizedBox(
                            width: 30,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage('images/google.png'),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ])),
        ),
      ),
    );
  }
}

class inputFeild extends StatelessWidget {
  String hint = '';
  var press;
  inputFeild({required this.hint,this.press});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.blueGrey),
          onChanged: press,
          decoration: KInputFeildDecoration.copyWith(hintText: hint)),
    );
  }
}
