import 'package:flutter/material.dart';
import 'package:movies/src/models/category.dart';
import 'package:movies/src/models/movie.dart';
import 'package:movies/src/utils/constants.dart';

import 'movies_item_body.dart';

class BodyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      padding: const EdgeInsets.all(12),
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 48),
        itemBuilder: (_, index) {
          return Padding(
            child: MovieItemBody(
              movie: Movie(
                title: 'Vigadores guerra infinita',
                poster: '/89QTZmn34iwXYeCpVxhC9UrT8sX.jpg',
                categories: [
                  Category(id: 28, name: 'Ação'),
                  Category(id: 12, name: 'Aventura'),
                ],
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          );
        },
      ),
    );
  }
}
