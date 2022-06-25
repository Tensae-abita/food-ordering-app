import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food/constants.dart';
import 'package:food/pages/details-screen.dart';
import 'package:provider/provider.dart';

import '../store/provider.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final _fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    // This size provide you the total height and width of the screen
    Size size = MediaQuery.of(context).size;
    var store = Provider.of<Store>(context);
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white10,
            elevation: 0,
            title: const Center(
              child: Text(
                "Your favorites are below",
                style: TextStyle(
                    color: kTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
          ),
          body: StreamBuilder<QuerySnapshot>(
              stream: _fireStore.collection('favorites').snapshots(),
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

                List<Container> messageBubbles = [];

                for (var message in messages!) {
                  final String name = message['name'];
                  final String cafe = message['cafe'];
                  final String image = message['image'];
                  final price = message['price'];

                  final messageBubble = Container(
                    // height: size.height * 0.22 ,
                    margin: const EdgeInsets.only(
                        left: 20, right: 15, top: 20, bottom: 20),
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
                        onTap: () {
                           store.setclickedProduct(message);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailsScreen();
                              },
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Image(
                                    fit: BoxFit.contain,
                                    width: size.width * 0.25,
                                    image: AssetImage(image),
                                  ),
                                  Column(
                                    children: [
                                      Text(name),
                                      const SizedBox(height: 10),
                                      Text(
                                        cafe,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                cafe,
                              ),
                              Column(
                                children: [
                                  IconButton(
                                      color: kPrimaryColor,
                                      iconSize: size.width * 0.20,
                                      onPressed: () {
                                        // setState(() {
                                        //   store.removeFromCart(store.cart[i]);
                                        // });
                                          FirebaseFirestore.instance
                                            .collection("favorites")
                                            .where("name", isEqualTo : message['name'])
                                            .get().then((value){
                                              for (var element in value.docs) {
                                              FirebaseFirestore.instance.collection("favorites").doc(element.id).delete().then((value){
                                                print("Success!");
                                              });
                                              }
                                            });
                                      },
                                      icon: const Icon(Icons.delete)),
                                  
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                  messageBubbles.add(messageBubble);
                }
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: messageBubbles,
                  ),
                );
              })),
    );
  }
}
