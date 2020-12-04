import 'package:cache_image/cache_image.dart';
import 'package:movies/src/models/category.dart';
import 'package:movies/src/models/movie.dart';
import 'package:movies/src/utils/constants.dart';
import 'package:flutter/material.dart';

class MovieItemBody extends StatelessWidget {
  final Movie movie;
  final double height;
  final double radius;
  final Function onTap;
  final List<Category> categories;

  const MovieItemBody({
    Key key,
    this.onTap,
    this.radius = 10,
    this.height = 430,
    @required this.movie,
    @required this.categories,
  }) : assert(movie != null);

  @override
  Widget build(BuildContext context) {
    final gradientColor = Colors.black;
    final shadowColor = Theme.of(context).accentColor;

    if (movie == null) return Container();

    return InkWell(
      onTap: onTap,
      child: Hero(
        tag: movie.hasImage ? movie.posterUrl : '',
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                spreadRadius: -10,
                offset: Offset(0, 20),
                color: shadowColor.withOpacity(0.55),
              ),
            ],
            borderRadius: BorderRadius.circular(radius),
            image: movie.hasImage
                ? DecorationImage(
                    fit: BoxFit.fill,
                    image: CacheImage(baseUrlImages + movie.posterUrl),
                  )
                : null,
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 198,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  gradientColor.withOpacity(0),
                  gradientColor.withOpacity(0.63),
                  gradientColor.withOpacity(1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius),
              ),
            ),
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(
              left: 24,
              bottom: 32,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title.toUpperCase(),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  categories.join(" - ").toUpperCase(),
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
