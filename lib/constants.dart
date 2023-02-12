import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFFFFC107);
const Color kSecondaryColor = Color(0xFF333333);

const Color kFontColor = Color(0xFF444444);
const Color kBackgroundColor = Color(0xFFFFFFFF);

const String imageExample = "https://i.ibb.co/09j2cyQ/ball.png";
String kErrorText = "Something went wrong, try again later.";

List<BoxShadow> kShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    blurRadius: 2,
    offset: const Offset(0, 5),
  ),
];


BorderRadius kRadiusBorder =  const BorderRadius.all(Radius.circular(4.0),);

BoxShadow shadow = BoxShadow(
  color: Colors.grey.withOpacity(0.5),
  spreadRadius: 2,
  blurRadius: 5,
  offset: const Offset(0, 3), // changes position of shadow
);
OutlineInputBorder getBorderStyle(Color color, double borderWidth )
{
  return OutlineInputBorder(
    borderRadius:  const BorderRadius.all(Radius.circular(8.0),),
    borderSide: BorderSide(color: color,width:borderWidth ),
  );
}
