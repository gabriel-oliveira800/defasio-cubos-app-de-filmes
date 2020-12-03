import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/src/models/category.dart';
import 'package:movies/src/models/movie.dart';
import 'package:flutter/material.dart';

import 'movies_item_body.dart';

class BodyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final data = Movie(
      title: 'Vigadores guerra infinita',
      posterUrl: '/89QTZmn34iwXYeCpVxhC9UrT8sX.jpg',
      categories: [28, 12],
    );

    return Container(
      width: size.width,
      height: size.height,
      padding: const EdgeInsets.all(12),
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 48),
        itemBuilder: (_, index) {
          return Padding(
            child: MovieItemBody(
              movie: data,
              onTap: () => Modular.to.pushNamed(
                '/detaisl_movies',
                arguments: data,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          );
        },
      ),
    );
  }
}
