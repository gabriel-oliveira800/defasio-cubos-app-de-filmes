import 'package:flutter/material.dart';
import 'package:movies/src/utils/constants.dart';

class WrapperBox extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final Color color;

  const WrapperBox({
    Key key,
    this.width,
    this.height,
    this.child,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: child,
      height: height ?? 40,
      width: width ?? size.width,
      color: color ?? backgroundColor,
    );
  }
}
