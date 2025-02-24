import 'package:flutter/material.dart';

const tempTextStyle = TextStyle(fontFamily: 'Spartan MB', fontSize: 100);

const messageTextStyle = TextStyle(fontFamily: 'Spartan MB', fontSize: 60);

const buttonTextStyle = TextStyle(fontSize: 30, fontFamily: 'Spartan MB');

const conditionTextStyle = TextStyle(fontSize: 100);

const textFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city, 
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color:Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  ),
);
