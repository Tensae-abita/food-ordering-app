import 'package:flutter/material.dart';

import 'category_item.dart';

class CategoryList extends StatefulWidget {
  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CategoryItem(
            title: "Burger",
            isActive: true,
            press: () {},
          ),
          CategoryItem(
       
            title: "Pizza",
            press: () {
              // setState(() {
              //   notActive =!notActive;
              //   active = !active;
              // });
            },
          ),
          CategoryItem(
            
            title: "Soft Drinks",
            press: () {
              // setState(() {
              //   isactive = true;
              // });
            },
          ),
          CategoryItem(
            title: "Beer",
            press: () {
              // setState(() {
              //   isactive = true;
              // });
            },
          ),
          CategoryItem(
            title: "Dessert",
            press: () {
              // setState(() {
              //   isactive = true;
              // });
            },
          ),
          CategoryItem(
            title: "Traditional",
            press: () {
              // setState(() {
              //   isactive = true;
              // });
            },
          ),
        ],
      ),
    );
  }
}
