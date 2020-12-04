import 'package:flutter/material.dart';

class TitleMovie extends StatelessWidget {
  final String title;
  final TextStyle style;

  const TitleMovie({
    Key key,
    @required this.title,
    @required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: RichText(
        text: TextSpan(
          text: 'Título original: ',
          children: [
            TextSpan(
              text: title,
              style: style.copyWith(
                fontWeight: FontWeight.w500,
              ),
            )
          ],
          style: style,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
    );
  }
}
