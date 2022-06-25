import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food/modal/product.dart';
import 'package:collection/collection.dart';

class Store extends ChangeNotifier {
  final _fireStore = FirebaseFirestore.instance;
  List<dynamic> _Populars = [];
  final List<dynamic> _Pizza = [];
  final List<dynamic> _cart = [];
  final List<dynamic> _drinks = [];
  final List<dynamic> _dessert = [];
  final List<dynamic> _traditional = [];

  final List<dynamic> _Favorite = [];
  late var _clickedProducts;

  Store() {
    _Populars = [];

    notifyListeners();
  }
  List<dynamic> get Pizza => _Pizza;
  List<dynamic> get Products => _Populars;
  List<dynamic> get Favorites => _Favorite;
  List<dynamic> get cart => _cart;
  List<dynamic> get drinks => _drinks;
  List<dynamic> get dessert => _dessert;
  List<dynamic> get traditional => _traditional;

  get clickedProducts => _clickedProducts;

  getDrink(food) {
    var found;
    for (var i = 0; i < _drinks.length; i++) {
      return found =
          _Favorite.firstWhereOrNull((e) => e['name'] == food['name']);
    }
    if (found == null) {
      _drinks.add(food);
    }
  }

  getTraditional(food) {
    var found;
    for (var i = 0; i < _traditional.length; i++) {
      return found =
          _Favorite.firstWhereOrNull((e) => e['name'] == food['name']);
    }
    if (found == null) {
      _traditional.add(food);
    }
  }

  getDessert(food) {
    var found;
    for (var i = 0; i < _dessert.length; i++) {
      return found =
          _Favorite.firstWhereOrNull((e) => e['name'] == food['name']);
    }
    if (found == null) {
      _dessert.add(food);
    }
  }

  getBurger(food) {
    var found;
    for (var i = 0; i < _Populars.length; i++) {
      return found =
          _Favorite.firstWhereOrNull((e) => e['name'] == food['name']);
    }
    if (found == null) {
      _Populars.add(food);
    }
  }

  getPizza(food) {
    var found;
    for (var i = 0; i < _Pizza.length; i++) {
      return found =
          _Favorite.firstWhereOrNull((e) => e['name'] == food['name']);
    }
    if (found == null) {
      _Pizza.add(food);
    }
  }

  setclickedProduct(p) {
    _clickedProducts = p;
  }

  addtoCartQty(p) {
    

      p['qty'] += 1;
      print('added');
    
    notifyListeners();
  }

  addtoCart(p) {
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

  addToFavorites(Product p) {
    var found = _Favorite.firstWhereOrNull((e) => e.id == p.id);

    if (found != null) {
      // found.qty += 1;
      print('alrady there');
    } else {
      _Favorite.add(p);
    }
    notifyListeners();
  }

  removeFromFavorites(Product p) {
    var found = _Favorite.firstWhereOrNull((e) => e.id == p.id);

    if (found != null) {
      _Favorite.remove(p);
      print('rem');
    }
    notifyListeners();
  }

  removeclickedProducts(p) {
    var found = _cart.firstWhereOrNull((e) => e.id == p.id);

    if (found != null && found.qty == 1) {
      found['qty'] = 0;
      _cart.remove(p);
      print('rem');
    } else if (found != null && found.qty > 1) {
      found['qty'] -= 1;
      print('removed');
    }
    notifyListeners();
  }

  int getTotalItems() {
    int total = 0;
    for (int i = 0; i < cart.length; i++) {
      // total += cart[i].qty;
    }
    return total;
  }

  removeFromCart(p) {
    cart.remove(p);
    notifyListeners();
  }

  int getTotalPrice() {
    var total = 0;
    for (int i = 0; i < cart.length; i++) {
      // total += cart[i]['qty'] * cart[i]['price'];
    }
    return total;
  }
}
