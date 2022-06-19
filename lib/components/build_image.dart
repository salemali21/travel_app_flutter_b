import 'package:flutter/material.dart';

class BuildImage extends StatelessWidget {
  const BuildImage({
    Key? key,
    required this.image,
    this.isNetworkImage = true,
    this.borderRadius = 15,
    this.width,
    this.height,
    this.fit,
  }) : super(key: key);
  final String image;
  final bool isNetworkImage;
  final double? borderRadius;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: FadeInImage(
        fit: fit != null ? fit : BoxFit.cover,
        placeholder: AssetImage("assets/images/placeholder.jpg"),
        image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
        imageErrorBuilder: (BuildContext, Object, StackTrace) =>
            Image.asset("assets/images/placeholder.jpg"),
      ),
    );
  }
}
