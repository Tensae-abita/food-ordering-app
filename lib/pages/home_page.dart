import 'package:flutter/material.dart';
import 'package:food/component/Catagory_pages/item_list_2.dart';
import 'package:food/component/Catagory_pages/item_list_3.dart';
import 'package:food/component/Catagory_pages/item_list_4.dart';
import 'package:food/component/Catagory_pages/item_list_5.dart';
import 'package:food/component/discount_card.dart';
import 'package:food/component/item_list.dart';
import 'package:food/constants.dart';

import '../component/category_item.dart';

class Home_Food extends StatefulWidget {
  const Home_Food({Key? key}) : super(key: key);

  @override
  State<Home_Food> createState() => _Home_FoodState();
}

class _Home_FoodState extends State<Home_Food> {
  int catagory_number = 1;
  bool active1 = true;
  bool active2 = false;
  bool active3 = false;
  bool active4 = false;
  bool active5 = false;
    @override
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Container(
                  margin: const EdgeInsets.all(20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: ksecondaryColor.withOpacity(0.32),
                    ),
                  ),
                  child: const TextField(
                    // onChanged: (value) => ,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                      hintText: "Search Here",
                      hintStyle: TextStyle(color: ksecondaryColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
         
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CategoryItem(
                  title: "Burger",
                  isActive: active1,
                  press: () {
                    setState(() {
                      catagory_number = 1;
                       active1 = true;
                       active2 = false;
                       active3 = false;
                       active4 = false;
                       active5 = false;
                       
                    });
                  },
                ),
                CategoryItem(
                  isActive: active2,
                  title: "Pizza",
                  press: () {
                    setState(() {
                      catagory_number = 2;
                       active1 = false;
                       active2 = true;
                      active3 = false;
                       active4 = false;
                       active5 = false;
                       
                    });
                  },
                ),
                CategoryItem(
                  isActive: active3,
                  title: "Drinks",
                  press: () {
                    setState(() {
                      catagory_number = 3;
                       active1 = false;
                       active2 = false;
                       active3 = true;
                       active4 = false;
                       active5 = false;
                      
                    });
                  },
                ),
                CategoryItem(
                  isActive: active4,
                  title: "Dessert",
                  press: () {
                    setState(() {
                      catagory_number = 4;
                       active1 = false;
                       active2 = false;
                       active3 = false;
                       active4 = true;
                       active5 = false;
                      
                    });
                  },
                ),
                CategoryItem(
                  isActive: active5,
                  title: "Traditional",
                  press: () {
                    setState(() {
                      catagory_number = 5;
                      active1 = false;
                      active2 = false;
                      active3 = false;
                      active4 = false;
                       active5 = true;
                    
                    });
                  },
                ),
               
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                if (catagory_number == 1) ...[
               const Padding(
                 padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                 child: Text(
            "Popular",
            style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor),
          ),
               ),
                  ItemList(),
                  DiscountCard(),
                  ItemList()
                ] else if ((catagory_number == 2)) ...[
                  ItemList_2(),
                  DiscountCard(),
                  ItemList_2()
                ] else if ((catagory_number == 3)) ...[
                  ItemList_3(),
                  DiscountCard(),
                  ItemList_3()
                ] else if ((catagory_number == 4)) ...[
                  ItemList_4(),
                  DiscountCard(),
                  ItemList_4()
                ] else if ((catagory_number == 5)) ...[
                  ItemList_5(),
                  DiscountCard(),
                  ItemList_5()
                ] 
              ],
            ),
          )
        ],
      ),
    ));
  }
}
