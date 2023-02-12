import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CacheImageWidget extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final double? height;
  final double? width;
  final Color color;
  const CacheImageWidget({Key? key, required this.image,required this.fit, this.height, this.width, this.color = const Color(0xFFEAA900)}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit ,
      imageUrl: image != "" ? image : "https://i.ibb.co/h15fCp9/person-icon.png",
      height: height,
      width: width ,
      errorWidget: (context, url, error) => const Icon(Icons.error,color: kPrimaryColor,),
    );
  }
}

