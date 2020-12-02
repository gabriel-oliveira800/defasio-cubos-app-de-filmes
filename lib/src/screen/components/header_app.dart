import 'package:flutter/material.dart';
import 'package:movies/src/utils/constants.dart';

class HeaderApp extends StatelessWidget {
  final Function(String) onChanged;
  const HeaderApp({Key key, @required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filmes',
            style: TextStyle(
              fontSize: 18,
              color: titleColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 24),
          Container(
            height: 68,
            width: size.width,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(68 / 2),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.search, color: Color(0xFF5E6770), size: 26),
                SizedBox(width: 18),
                Expanded(
                  child: TextField(
                    onChanged: onChanged,
                    style: TextStyle(
                      fontSize: 14,
                      color: subtitleColor,
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: InputDecoration.collapsed(
                      hintText: 'Pesquise filmes',
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
