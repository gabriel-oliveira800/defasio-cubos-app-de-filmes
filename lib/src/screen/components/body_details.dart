import 'package:flutter/material.dart';

import 'image_banner.dart';
import 'rated_movie.dart';

class BodyDetails extends StatelessWidget {
  final Size size;
  const BodyDetails({Key key, @required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final url =
        'https://image.tmdb.org/t/p/w500/89QTZmn34iwXYeCpVxhC9UrT8sX.jpg';

    return Column(
      children: [
        ImageBanner(imageUrl: url, size: size),
        RatedMovie(rated: '7.3'),
        Text(
          'Vingadores guerra infinita'.toUpperCase(),
          style: _descriptionStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF343A40),
          ),
        ),
        SizedBox(height: 12),
        RichText(
          text: TextSpan(
            text: 'Título original: ',
            children: [
              TextSpan(
                text: 'Captain Marvel',
                style: _descriptionStyle.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
            style: _descriptionStyle,
          ),
        ),
        SizedBox(height: 32),
        ImageBanner(imageUrl: url, size: size),
        ImageBanner(imageUrl: url, size: size),
        ImageBanner(imageUrl: url, size: size),
        ImageBanner(imageUrl: url, size: size),
        ImageBanner(imageUrl: url, size: size),
        ImageBanner(imageUrl: url, size: size),
        ImageBanner(imageUrl: url, size: size),
      ],
    );
  }

  TextStyle get _descriptionStyle => TextStyle(
        fontSize: 10,
        color: Color(0xFF5E6770),
        fontWeight: FontWeight.normal,
      );
}
