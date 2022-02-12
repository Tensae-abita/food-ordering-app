import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food/modal/product.dart';
import 'package:collection/collection.dart';

class Store extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _cart = [];
  late Product _clickedProducts;

  Store() {
    _products = [
      Product(
          price: 20,
          id: 1,
          name: 'Banana',
          qty: 0,
          pic:
              'https://media.istockphoto.com/photos/banana-bunch-picture-id173242750?k=20&m=173242750&s=612x612&w=0&h=dgXrAP6otDeY5h6fhy-SRmW-2dFOCKx1_hNS1lLWF7Y='),
      Product(
          price: 30,
          id: 2,
          name: 'Orange',
          qty: 0,
          pic:
              'https://media.istockphoto.com/photos/banana-bunch-picture-id173242750?k=20&m=173242750&s=612x612&w=0&h=dgXrAP6otDeY5h6fhy-SRmW-2dFOCKx1_hNS1lLWF7Y='),
      Product(
          price: 35,
          id: 3,
          name: 'Mango',
          qty: 0,
          pic:
              'https://media.istockphoto.com/photos/banana-bunch-picture-id173242750?k=20&m=173242750&s=612x612&w=0&h=dgXrAP6otDeY5h6fhy-SRmW-2dFOCKx1_hNS1lLWF7Y='),
      Product(
          price: 50,
          id: 4,
          name: 'Apple',
          qty: 0,
          pic:
              'https://media.istockphoto.com/photos/banana-bunch-picture-id173242750?k=20&m=173242750&s=612x612&w=0&h=dgXrAP6otDeY5h6fhy-SRmW-2dFOCKx1_hNS1lLWF7Y=')
    ];
    notifyListeners();
  }
  List<Product> get Products => _products;
  List<Product> get cart => _cart;
  Product get clickedProducts => _clickedProducts;

  setclickedProduct(Product p) {
    _clickedProducts = p;
  }

  addclickedProducts(Product p) {
    var found = _cart.firstWhereOrNull((e) => e.id == p.id);

    if (found != null) {
      found.qty += 1;
      print('added');
    } else {
      _cart.add(p);
      var founded = _cart.firstWhereOrNull((e) => e.id == p.id);
      founded!.qty += 1;
    }
    notifyListeners();
  }

  removeclickedProducts(Product p) {
    var found = _cart.firstWhereOrNull((e) => e.id == p.id);

    if (found != null && found.qty == 1) {
      found.qty = 0;
      _cart.remove(p);
      print('rem');
    } else if (found != null && found.qty > 1) {
      found.qty -= 1;
      print('removed');
    }
    notifyListeners();
  }

 int getTotalItems() {
    int total = 0;
    for (int i = 0; i < cart.length; i++) {
      total += cart[i].qty;
    }
    return total;
  }
}
