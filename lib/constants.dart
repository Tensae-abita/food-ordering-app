import 'package:flutter/material.dart';

const KInputFeildDecoration = InputDecoration(
  hintStyle: TextStyle(color: Colors.blueGrey),
  hintText: 'Enter your password.',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

var KButtonStyle = ButtonStyle(
  shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFFC61F)),
  alignment: Alignment.center,
);

const kPrimaryColor = Color(0xFFFFC61F);

const ksecondaryColor = Color(0xFFB5BFD0);
const kTextColor = Color(0xFF50505D);
const kTextLightColor = Color(0xFF6A727D);

const List<String> KpopUPs = [
"Refresh",
"Add to favorite",

];
