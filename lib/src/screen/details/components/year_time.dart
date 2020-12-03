import 'package:flutter/material.dart';

class YearTimeMovie extends StatelessWidget {
  final String title;
  final double height;
  final String subtitle;
  final Alignment alignment;
  final Color backgrandColor;

  const YearTimeMovie({
    Key key,
    this.alignment,
    this.height = 38,
    this.backgrandColor,
    @required this.title,
    @required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _style = TextStyle(
      fontSize: 14,
      color: Color(0xFF343A40),
      fontWeight: FontWeight.w600,
    );

    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: backgrandColor ?? Color(0xFFF1F3F5),
      ),
      alignment: alignment ??  Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: RichText(
        text: TextSpan(
          text: subtitle,
          children: [TextSpan(text: title, style: _style)],
          style: _style.copyWith(
            fontSize: 12,
            color: Color(0xFF868E96),
          ),
        ),
      ),
    );
  }
}
