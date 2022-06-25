import 'package:flutter/material.dart';
import 'package:food/constants.dart';
import 'package:food/main_page.dart';

import 'components/succesfullypaid_Button.dart';



class Success_Page extends StatefulWidget {
  const Success_Page({Key? key}) : super(key: key);

  @override
  State<Success_Page> createState() => _Success_PageState();
}

class _Success_PageState extends State<Success_Page> {
  @override
  Widget build(BuildContext context) {
  var  screenWidth = MediaQuery.of(context).size.width;
   var  screenHeight = MediaQuery.of(context).size.height;
   Future.delayed(const Duration(milliseconds: 8000), () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const MainPage();
                },
              ),
            );

          });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 170,
              padding: const EdgeInsets.all(35),
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                "images/images/card.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            const Text(
              "Thank You!",
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 36,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            const Text(
              "Payment done Successfully",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            const Text(
              "You will be redirected to the home page shortly\nor click here to return to home page",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            SizedBox(height: screenHeight * 0.06),
            Flexible(
              child: HomeButton(
                title: 'Home',
                onTap: () {
                   Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const MainPage();
                            },
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}