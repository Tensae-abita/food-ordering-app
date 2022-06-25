import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food/pages/details-screen.dart';
import 'package:provider/provider.dart';

import '../component/item_card.dart';
import '../constants.dart';
import '../store/provider.dart';

class From_Restaurant extends StatefulWidget {
  String cafename;
  From_Restaurant(this.cafename, {Key? key}) : super(key: key);

  @override
  State<From_Restaurant> createState() => _From_RestaurantState();
}

class _From_RestaurantState extends State<From_Restaurant> {
  final _fireStore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<Store>(context);

    return MaterialApp(
      home: Scaffold(
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
          ),
          body: StreamBuilder<QuerySnapshot>(
              stream: _fireStore.collection('foods').snapshots(),
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

                store.getBurger(messages);

                List<ItemCard> messageBubbles = [];
                for (var ab = 0; ab < store.Products.length; ab++) {
                  for (var message in store.Products[ab]) {
                    final String name = message['name'];
                    final String cafe = message['cafe'];
                    final String image = message['image'];
                    final price = message['price'];
                    if (message['cafe'] == widget.cafename) {
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
                }
                return SingleChildScrollView(
                  
                  child: Column(
                    children: messageBubbles,
                  ),
                );
              })),
    );
  }
}
