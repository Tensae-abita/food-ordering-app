import 'package:flutter/material.dart';
import 'package:food/store/provider.dart';
import 'package:provider/provider.dart';

class Cart_page extends StatefulWidget {
  static const id = 'cart';

  @override
  _Cart_pageState createState() => _Cart_pageState();
}

class _Cart_pageState extends State<Cart_page> {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<Store>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: store.cart.length,
          itemBuilder: (context, i) {
            return Column(
              children: [
                Text(store.cart[i].name),
                Container(
                  width: 100,
                  height: 80,
                  child: FadeInImage.assetNetwork(
                      placeholder: 'pic', image: store.cart[i].pic),
                ),
                Text(store.cart[i].price.toString()),
              ],
            );
          },
        ),
      ),
    );
  }
}
