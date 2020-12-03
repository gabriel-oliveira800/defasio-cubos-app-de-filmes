import 'package:flutter/material.dart';

class MovieDescription extends StatelessWidget {
  final double width;
  final String title;
  final String overview;

  final TextStyle styleTitle;
  final TextStyle stylesubTitle;

  const MovieDescription({
    this.styleTitle,
    this.width = 120,
    this.stylesubTitle,
    @required this.title,
    @required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: styleTitle),
          SizedBox(height: 4),
          Text(overview, style: stylesubTitle, textAlign: TextAlign.left),
        ],
      ),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20, right: 10),
    );
  }
}
