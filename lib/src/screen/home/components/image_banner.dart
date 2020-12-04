import 'package:cache_image/cache_image.dart';
import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  final String tag;
  final double width;
  final double height;
  final double radius;
  final String imageUrl;

  const ImageBanner({
    Key key,
    this.width,
    this.height,
    this.tag = '',
    this.radius = 10,
    @required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _defaultWidth = 200.0;
    final _defaultHeight = 300.0;

    return Hero(
      tag: tag,
      child: Container(
        width: width ?? _defaultWidth,
        height: height ?? _defaultHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              spreadRadius: -10,
              offset: Offset(0, 20),
              color: Color.fromRGBO(0, 56, 76, 0.25),
            ),
          ],
          image: DecorationImage(image: CacheImage(imageUrl)),
        ),
      ),
    );
  }
}
