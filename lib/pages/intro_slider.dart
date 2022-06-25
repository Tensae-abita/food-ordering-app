import 'package:flutter/material.dart';
import 'package:food/constants.dart';
import 'package:food/pages/login_page.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Slider_Intro extends StatefulWidget {
  static const id = 'Slider_screen';

  @override
  State<Slider_Intro> createState() => _Slider_IntroState();
}

class _Slider_IntroState extends State<Slider_Intro> {
  List<Slide> slides = [];
  bool ShowSpinner = false;
  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title: "Place Your Order",
        styleTitle: const TextStyle(
            color: kPrimaryColor,
            fontSize: 30,
            fontWeight: FontWeight.bold),
        description:
            "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        styleDescription:
            const TextStyle(color: Color(0xff032A49), fontSize: 20),
        centerWidget: const Image(image: AssetImage('images/thef.webp')),
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      Slide(
        title: "Pay Online",
        styleTitle: const TextStyle(
            color: kPrimaryColor,
            fontSize: 30,
            fontWeight: FontWeight.bold),
        description:
            "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        styleDescription:
            const TextStyle(color: Color(0xff032A49), fontSize: 20),
        centerWidget:
            const Image(height: 300, image: AssetImage('images/payig.webp')),
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      Slide(
        title: "Fast Delivery",
        styleTitle: const TextStyle(
            color: kPrimaryColor,
            fontSize: 30,
            fontWeight: FontWeight.bold),
        widgetDescription: Column(
          children: [
            const Text(
              "Allow miles wound place the leave had. To sitting subject no improve studied limited",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff032A49),
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
              
                onPressed: () {
                  setState(() {
                    ShowSpinner = true;
                  });
                  
                  Navigator.pushNamed(context, Home.id);
                  setState(() {
                    ShowSpinner = false;
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('GET STARTED',
                      style: TextStyle(color: Colors.white)),
                ),
                style: KButtonStyle)
          ],
        ),
        centerWidget:
            const Image(image: AssetImage('images/delivery_guy.webp')),
        backgroundColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: ShowSpinner,
      child: IntroSlider(
        slides: slides,
        showNextBtn: true,
        showSkipBtn: false,
        showPrevBtn: false,
        showDoneBtn: false,
      ),
    );
  }
}
