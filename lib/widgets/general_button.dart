import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';
import 'general_text.dart';

class GeneralButton extends StatefulWidget {
  final String text;
  final double fontSize;
  final Color? backgroundColor;
  final Color? borderColor;
  final void Function()? onPressed;
  final double widthMargin;
  final double heightMargin;
  final double? width;
  final double borderWidth;
  final double? height;
  final IconData? iconData;
  final double elevation;
  const GeneralButton({Key? key,required this.text,required this.onPressed, this.elevation = 2.0,this.backgroundColor, this.borderColor, this.widthMargin = 0.0, this.fontSize=14, this.width=double.infinity, this.borderWidth=10, this.heightMargin=8, this.height = 54, this.iconData}) : super(key: key);

  @override
  State<GeneralButton> createState() => _GeneralButtonState();
}

class _GeneralButtonState extends State<GeneralButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(widget.widthMargin),vertical: getProportionateScreenHeight(widget.heightMargin),),
      padding: EdgeInsets.zero,
      width: widget.width,
      child: RawMaterialButton(
        elevation: widget.elevation,
        fillColor: widget.backgroundColor?.withOpacity(0.8)??kPrimaryColor.withOpacity(0.8),
        focusElevation: 0.0,
        focusColor: widget.backgroundColor??kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32,),
          side: widget.borderColor != null ? BorderSide(color: widget.borderColor!) : BorderSide.none,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 4),
        onPressed: widget.onPressed,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Row(
            children: [
              if(widget.iconData != null)
                Row(
                  children: [
                    Icon(widget.iconData, color: Colors.white,),
                    const SizedBox(width: 4,),
                  ],
                ),
              GeneralText(
                text: widget.text,
                color: widget.borderColor ?? Colors.white,
                isBold: true,
                size: widget.fontSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}