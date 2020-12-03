import 'package:flutter/material.dart';

class LoadingBox extends StatelessWidget {
  final double width;
  final double height;

  const LoadingBox({
    Key key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      constraints: BoxConstraints(
        minHeight: 60,
        minWidth: 80,
      ),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
        ),
      ),
    );
  }
}
