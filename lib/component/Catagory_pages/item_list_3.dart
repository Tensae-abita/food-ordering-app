import 'package:flutter/material.dart';
import 'package:food/component/item_card.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food/pages/details-screen.dart';
import 'package:provider/provider.dart';

import '../../store/provider.dart';

class ItemList_3 extends StatefulWidget {
  @override
  State<ItemList_3> createState() => _ItemList_3State();
}

class _ItemList_3State extends State<ItemList_3> {
  final _fireStore = FirebaseFirestore.instance;

  var Food = [];

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<Store>(context);

    return StreamBuilder<QuerySnapshot>(
        stream: _fireStore.collection('drinks').snapshots(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          final messages = snapshot.data?.docs;
          print(messages);
          store.getDrink(messages);

          List<ItemCard> messageBubbles = [];
          for (var ab = 0; ab < store.drinks.length; ab++) {
            for (var message in store.drinks[ab]) {
              final String name = message['name'];
              final String cafe = message['cafe'];
              final String image = message['image'];
              final price = message['price'];

              final messageBubble = ItemCard(
                title: name,
                shopName: cafe,
                svgSrc: image,
                press: () {
                  store.setclickedProduct(message);
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailsScreen(
                            // Food_Price: price,
                            // Cafe_name:cafe,
                            // Food_image: image,
                            // Food_name: name,
                            );
                      },
                    ),
                  );
                },
              );
              messageBubbles.add(messageBubble);
            }
          }
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: messageBubbles,
            ),
          );
        });
  }
}
