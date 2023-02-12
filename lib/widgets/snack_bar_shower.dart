import 'package:flutter/material.dart';
import '../constants.dart';
import '../main.dart';

void snackBarShower(String text )
{
  final snackBar = SnackBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),)
      ),
      backgroundColor: kPrimaryColor,
      content:  Text(text ,style: const TextStyle(color: Colors.white,),)
  );
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
}