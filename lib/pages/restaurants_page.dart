import 'package:flutter/material.dart';
import 'package:food/constants.dart';
import 'package:food/pages/From_Restaurant.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({Key? key}) : super(key: key);

  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  @override
  Widget build(BuildContext context) {
    // This size provide you the total height and width of the screen

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
          title: const Center(
            child: Text(
              "Restaurants",
              style: TextStyle(
                  color: kTextColor, fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Restaurant_button(
                backColor: Colors.blueAccent,
                cafeLogo: "",
                text1: "Ours",
                backgroundPic: "images/images/ours_cafe.jpg",
                press: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return From_Restaurant("Ours");
                    },
                  ),
                );
                },
              ),
              Restaurant_button(
                backColor: Colors.redAccent,
                cafeLogo: "",
                text1: "Burger Bar",
                backgroundPic: "images/images/burgerBar.jpg",
                 press: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return From_Restaurant("Burger Bar");
                    },
                  ),
                );
                },
              ),
              Restaurant_button(
                backColor: Colors.blueAccent,
                cafeLogo: "",
                text1: "Smiley",
                backgroundPic: "images/images/burgerBar2.jpg",
                 press: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return From_Restaurant("Smiley");
                    },
                  ),
                );
                },
              ),
              Restaurant_button(
                backColor: Colors.blueAccent,
                cafeLogo: "",
                text1: "Ours",
                backgroundPic: "images/images/burgerBar2.jpg",
                 press: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return From_Restaurant("Ours");
                    },
                  ),
                );
                },
              ),
              Restaurant_button(
                backColor: Colors.redAccent,
                cafeLogo: "",
                text1: "Smiley",
                backgroundPic: "images/images/burgerBar2.jpg",
                 press: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return From_Restaurant("Smiley");
                    },
                  ),
                );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Restaurant_button extends StatelessWidget {
  var backgroundPic;
  var cafeLogo;
  var backColor;
  var text1;
  var press;
  Restaurant_button({
    this.backColor,
    this.backgroundPic,
    this.cafeLogo,
    this.text1,
    this.press,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        height: 166,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(backgroundPic),
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                backColor.withOpacity(0.7),
                kPrimaryColor.withOpacity(0.7),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Image(image: AssetImage(cafeLogo)),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        const TextSpan(
                          text: "Get Discount of \n",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextSpan(
                          text: text1,
                          style: const TextStyle(
                            fontSize: 43,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text:
                              "at MacDonald's on your first order & Instant cashback",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
