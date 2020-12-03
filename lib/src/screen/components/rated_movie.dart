import 'package:flutter/material.dart';

class RatedMovie extends StatelessWidget {
  final double width;
  final String rated;

  const RatedMovie({
    Key key,
    this.width = 80,
    @required this.rated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: Container(
        width: width,
        alignment: Alignment.center,
        child: RichText(
          text: TextSpan(
            text: rated ?? '',
            children: [
              TextSpan(
                text: ' / 10',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF868E96),
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).accentColor,
            ),
          ),
          textAlign: TextAlign.center,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 32.0),
    );
  }
}
