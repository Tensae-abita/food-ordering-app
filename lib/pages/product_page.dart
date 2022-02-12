import 'dart:html';

import 'package:flutter/material.dart';
import 'package:food/pages/cart_page.dart';
import 'package:food/pages/product_datail_page.dart';
import 'package:food/store/provider.dart';
import 'package:provider/provider.dart';

class Product_page extends StatelessWidget {
  static const id = 'product_page';
  String name;
  Product_page({this.name = ''});

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<Store>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(name),
          actions: [
            Text(store.getTotalItems().toString()),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Cart_page()));
                },
                child: Icon(Icons.shop_2_outlined))
          ],
        ),
        body: GridView.builder(
            itemCount: store.Products.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => {
                  store.setclickedProduct(store.Products[index]),
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Product_detail()))
                },
                child: Column(
                  children: [
                    Container(
                        height: 150,
                        width: 150,
                        child: FadeInImage.assetNetwork(
                            fit: BoxFit.contain,
                            placeholder: 'banana',
                            image: store.Products[index].pic)),
                    Text(store.Products[index].name),
                    Text(store.Products[index].price.toString())
                  ],
                ),
              );
            }));
  }
}
