import 'package:flutter/material.dart';
import 'package:food/pages/cart_page.dart';
import 'package:food/store/provider.dart';
import 'package:provider/provider.dart';

class Product_detail extends StatefulWidget {
  static const id = 'product_detail';

  @override
  _Product_detailState createState() => _Product_detailState();
}

class _Product_detailState extends State<Product_detail> {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<Store>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(store.clickedProducts.name),
        actions: [
          Text(store.getTotalItems().toString()),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Cart_page()));
              },
              child: Icon(Icons.shop_2_outlined))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 150,
              width: 150,
              child: FadeInImage.assetNetwork(
                  placeholder: '', image: store.clickedProducts.pic),
            ),
            SizedBox(
              height: 30,
            ),
            Text(store.clickedProducts.name),
            SizedBox(
              height: 30,
            ),
            Text(store.clickedProducts.price.toString()),
            SizedBox(
              height: 200,
            ),
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        //INCREMENT QTY BY ONE

                        store.addclickedProducts(store.clickedProducts);
                      },
                      child: Icon(Icons.add)),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12)),
                      child: Text(
                        store.clickedProducts.qty.toString(),
                      )),
                  TextButton(
                      onPressed: () {
                        //REMOVE PRODUCTS

                        store.removeclickedProducts(store.clickedProducts);
                      },
                      child: Icon(Icons.remove)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
