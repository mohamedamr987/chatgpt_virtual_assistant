import 'package:flutter/material.dart';
import '../responsive.dart';
import '../size_config.dart';

class GeneralText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final bool isBold;
  final FontWeight? fontWeight;
  final double margin ;
  final TextDecoration textDecoration;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextOverflow? overflow;
  const GeneralText(
      {Key? key,
      required this.text,
      this.size = 14,
      this.margin = 0,
      this.color = Colors.white,
      this.isBold = false,
      this.textDecoration = TextDecoration.none,
      this.textAlign = TextAlign.start,
      this.textDirection,
      this.overflow,
      this.fontWeight,
  })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(margin)),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: fontWeight ?? (isBold ? FontWeight.bold : FontWeight.normal),
          fontSize:  Responsive.isDesktop(context) ?  size * 1.5 :  Responsive.isTablet(context) ?  size * 1.2 :  Responsive.isMobileLarge(context) ?  size :  getProportionateScreenWidth(size),
          color: color,
          decoration: textDecoration,
        ),
        textAlign: textAlign,
        overflow: overflow,
      ),
    );
  }
}
