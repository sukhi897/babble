import 'package:flutter/material.dart';

//Colors and palette
const Color default1 = Colors.lightBlueAccent;
const Color default2 = Colors.blueAccent;

const Color linen = Color(0xFFFFEDE1);
const Color aliceBlue = Color(0xFFEBF2FF);
const Color babyBlueEyes = Color(0xFFAFCBFF);
const Color bdazzledBlue = Color(0xFF2954A3);
const Color oxfordBlue = Color(0xFF0E1C36);
const Color carnelian = Color(0xFFBD1E1E);
const Color mandarin = Color(0xFFEF7B45);
const Color persimmon = Color(0xFFEB5F1E);

const Color kbackgroundColor = Colors.white;
const Color kspinnerColor = oxfordBlue;

const kSendButtonTextStyle = TextStyle(
  color: bdazzledBlue,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: bdazzledBlue, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

enum Menu { logout }
