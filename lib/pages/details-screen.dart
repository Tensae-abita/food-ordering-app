import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:food/constants.dart';
import 'package:provider/provider.dart';

import '../store/provider.dart';
import 'components/item_image.dart';
import 'components/order_button.dart';
import 'components/title_price_rating.dart';

class DetailsScreen extends StatelessWidget {
  final _fireStore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var store = Provider.of<Store>(context);
    selectedPopUp(String choice) {
      if (choice == 'Refresh') {
        print('refresh');
      } else if (choice == 'Add to favorite') {
        _fireStore.collection('favorites').add({
          'name':store.clickedProducts['name'],
          'image':store.clickedProducts['image'],
          'price':store.clickedProducts['price'],
          'cafe':store.clickedProducts['cafe'],
          'qty':store.clickedProducts['qty']
        });
      }
    }

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset("images/icons/share.svg"),
            onPressed: () {},
          ),
          PopupMenuButton(
              onSelected: selectedPopUp,
              itemBuilder: (BuildContext context) {
                return KpopUPs.map((String choice) {
                  return PopupMenuItem(value: choice, child: Text(choice));
                }).toList();
              })
          // IconButton(
          //   icon: SvgPicture.asset("images/icons/more.svg"),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: Column(
        children: <Widget>[
          // ignore: prefer_const_constructors
          ItemImage(
            imgSrc: store.clickedProducts['image'],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: <Widget>[
                  shopeName(name: store.clickedProducts['cafe']),
                  TitlePriceRating(
                    name: store.clickedProducts['name'],
                    numOfReviews: 24,
                    rating: 4,
                    price: store.clickedProducts['price'],
                    onRatingChanged: (value) {},
                  ),
                  const Text(
                    '',
                    style: TextStyle(
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: size.height * 0.1),
                  // Free space  10% of total height
                  OrderButton(
                    Button_Name: "Add to Cart",
                    size: size,
                    press: () {
                      store.addtoCart(store.clickedProducts);
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Row shopeName({String? name}) {
  return Row(
    children: <Widget>[
      const Icon(
        Icons.location_on,
        color: ksecondaryColor,
      ),
      const SizedBox(width: 10),
      Text(name!),
    ],
  );
}
