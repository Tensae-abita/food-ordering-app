import 'package:flutter/material.dart';
import 'package:food/pages/product_page.dart';

import 'store/provider.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  static const id = 'main_page';
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>Store(),
      child: MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('fews'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              CafeName(nameofCafe: 'Ager',name: 'Ager Cafe',),
              SizedBox(
                height: 10,
              ),
              CafeName(
                nameofCafe: 'Ours',
                name: 'Ours Cafe'
              ),
            ],
          ),
        ],
      ),
    )));
  }
}

class CafeName extends StatelessWidget {
  final String nameofCafe;
  final String name;
  const CafeName({
    required this.name,
    required this.nameofCafe,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      
      child: FlatButton(
        
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Product_page(
                        name: nameofCafe,
                      )));
        },
        child: Text(
          name,
          style: TextStyle(
          color: Colors.lightBlueAccent,
          fontSize: 30,
          fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
