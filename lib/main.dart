

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food/pages/intro_slider.dart';
import 'package:food/pages/login_page.dart';
import 'package:food/store/provider.dart';
import 'package:provider/provider.dart';


import 'main_page.dart';

import 'register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // FlutterBranchSdk.validateSDKIntegration();
  
   await Firebase.initializeApp();
  runApp(const Fewws());
}

class Fewws extends StatelessWidget {
  const Fewws({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Store(),
        child: MaterialApp(
      initialRoute: Slider_Intro.id,
      routes: {
        Slider_Intro.id: (context) => Slider_Intro(),
        Home.id: (context) => const Home(),
        Register.id: (context) => const Register(),
        MainPage.id: (context) => const MainPage(),
       
      },
    ));
  }
}

