import 'package:flutter/material.dart';

import 'cache_image_widget.dart';

class GeneralImageWidget extends StatelessWidget {
  final String? image;
  final double dimension;
  final BoxShape boxShape;
  const GeneralImageWidget({Key? key,required this.image, this.dimension = 60, this.boxShape = BoxShape.rectangle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: boxShape,
      ),
      child: (() {
        if(image == null) {
          return Image.asset("assets/logo.png", width: dimension, height: dimension,);
        } else {
          return CacheImageWidget(image: image!, fit: BoxFit.contain, width: dimension, height: dimension,);
        }
      }()),
    );
  }
}
