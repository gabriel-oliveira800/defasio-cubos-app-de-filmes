import 'package:flutter/material.dart';

class ButtonMovie extends StatelessWidget {
  final Color color;
  final String text;
  final double width;
  final IconData icon;
  final Function onPressed;

  const ButtonMovie({
    Key key,
    this.color,
    this.text = '',
    this.width = 240,
    @required this.onPressed,
    this.icon = Icons.refresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: width,
      child: RaisedButton.icon(
        onPressed: onPressed,
        label: Text(
          text ?? '',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        icon: Icon(Icons.refresh, color: Colors.white),
        color: color ?? Theme.of(context).accentColor,
      ),
    );
  }
}
