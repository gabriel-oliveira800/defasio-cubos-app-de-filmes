import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/src/models/category.dart';
import 'package:movies/src/models/movie.dart';
import 'package:flutter/material.dart';

import 'loading.dart';
import 'movies_item_body.dart';

class BodyHome extends StatelessWidget {
  final bool loading;
  final List<Movie> movies;
  final List<Category> categories;

  const BodyHome({
    Key key,
    this.loading = false,
    @required this.movies,
    @required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (loading) {
      return LoadingBox(
        width: size.width,
        height: size.height / 1.25,
      );
    }

    return Container(
      width: size.width,
      height: size.height,
      padding: const EdgeInsets.all(12),
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 48),
        itemCount: movies.length,
        itemBuilder: (_, index) {
          var item = movies[index];
          var categoriesItems = <Category>[];

          item.categories.map((ids) {
             categories.where((element) {
               if(element.id == ids) categoriesItems.add(element);
               return true;
             }).toList();
          }).toList();

          return Padding(
            child: MovieItemBody(
              movie: item,
              categories: categoriesItems,
              onTap: () => Modular.to.pushNamed(
                '/detaisl_movies',
                arguments: item,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          );
        },
      ),
    );
  }
}
