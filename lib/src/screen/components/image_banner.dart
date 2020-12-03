import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget {
  final Size size;
  final String imageUrl;

  const ImageBanner({
    Key key,
    @required this.size,
    @required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 216,
      height: 318,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            spreadRadius: -10,
            offset: Offset(0, 20),
            color: Color.fromRGBO(0, 56, 76, 0.25),
          ),
        ],
        image: DecorationImage(image: NetworkImage(imageUrl)),
      ),
    );
  }
}
