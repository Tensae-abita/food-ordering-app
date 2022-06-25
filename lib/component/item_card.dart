import 'package:flutter/material.dart';


class ItemCard extends StatelessWidget {
  final String title, shopName, svgSrc;
  final  press;
  const ItemCard({
    
    required this.title,
   required this.shopName,
   required this.svgSrc,
   required this.press,
  }) ;

  @override
  Widget build(BuildContext context) {
    // This size provide you the total height and width of the screen
    Size size = MediaQuery.of(context).size;
    return Container(
      // height: size.height * 0.22 ,
      margin: const EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 20,
            color: const Color(0xFFB0CCE1).withOpacity(0.32),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image(
                  fit: BoxFit.contain,
                  width:  size.width * 0.25,
                  image: AssetImage(svgSrc),),
                Column(
                  children: [
                    Text(title),
                const SizedBox(height: 10),
                Text(
                  shopName,
                  style: const TextStyle(fontSize: 12),
                ),
                  ],
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
