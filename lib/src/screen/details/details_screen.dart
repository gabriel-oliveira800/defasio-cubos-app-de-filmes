import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/src/controllers/tab_store.dart';
import 'package:movies/src/models/category.dart';
import 'package:movies/src/utils/constants.dart';
import 'package:movies/src/models/movie.dart';
import 'package:flutter/material.dart';

import 'components/year_time.dart';
import 'components/poster_back.dart';
import 'components/rated_movie.dart';
import 'components/crew_cast_item.dart';
import 'components/details_category.dart';
import 'components/movie_description.dart';
import '../home/components/image_banner.dart';

class DetailsScreen extends StatefulWidget {
  final Movie movie;
  const DetailsScreen({Key key, @required this.movie}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var tabStore = Modular.get<TabStore>();

  Movie get movie => widget.movie;

  @override
  Widget build(BuildContext context) {
    final _colorTitle = Color(0xFF343A40);
    final _colorsubTitle = Color(0xFF5E6770);

    final size = MediaQuery.of(context).size;

    var categoriesItems = <Category>[];
    movie.categories.map((ids) {
      tabStore.categories.where((element) {
        if (element.id == ids) categoriesItems.add(element);
        return true;
      }).toList();
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PosterBannerBack(
                height: 280,
                width: size.width,
                onTap: () => Modular.to.pop(),
              ),
              SizedBox(
                width: 216,
                height: 116,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: -180,
                      child: ImageBanner(
                        tag: movie.posterUrl,
                        imageUrl: baseUrlImages + movie.posterUrl,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: RatedMovie(rated: movie.rated.toStringAsFixed(2)),
              ),
              Text(
                movie.title.toUpperCase(),
                style: _descriptionStyle.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: _colorTitle,
                ),
              ),
              SizedBox(height: 12),
              RichText(
                text: TextSpan(
                  text: 'Título original: ',
                  children: [
                    TextSpan(
                      text: movie.originalTitle.toUpperCase(),
                      style: _descriptionStyle.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                  style: _descriptionStyle,
                ),
              ),
              Padding(
                child: Row(
                  children: [
                    YearTimeMovie(
                      subtitle: 'ano: ',
                      title: '${movie.releaseDate.year}',
                    ),
                    Spacer(),
                    YearTimeMovie(title: '1h 20 min', subtitle: 'duração: ')
                  ],
                ),
                padding: const EdgeInsets.only(
                  left: 44,
                  top: 18,
                  right: 44,
                  bottom: 12,
                ),
              ),
              SizedBox(height: 12),
              DetailsCategory(
                color: _colorsubTitle,
                categories: categoriesItems,
              ),
              SizedBox(height: 63),
              MovieDescription(
                width: size.width,
                title: 'Descrição',
                overview: movie.overview,
                styleTitle: TextStyle(
                  fontSize: 14,
                  color: _colorsubTitle,
                  fontWeight: FontWeight.normal,
                ),
                stylesubTitle: TextStyle(
                  fontSize: 12,
                  color: _colorTitle,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 40),
              Padding(
                child: Column(
                  children: [
                    YearTimeMovie(
                      subtitle: 'ORÇAMENTO: ',
                      title: '\$ 152,000,000',
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(height: 4),
                    YearTimeMovie(
                      subtitle: 'PRODUTORAS: ',
                      title: 'MARVEL STUDIOS',
                      alignment: Alignment.centerLeft,
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
              ),
              SizedBox(height: 40),
              Padding(
                child: CrewCastItem(
                  crews: [],
                  cats: [],
                  width: size.width,
                  styleTitle: TextStyle(
                    fontSize: 14,
                    color: _colorsubTitle,
                    fontWeight: FontWeight.normal,
                  ),
                  stylesubTitle: TextStyle(
                    fontSize: 12,
                    color: _colorTitle,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              SizedBox(height: 90),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle get _descriptionStyle => TextStyle(
        fontSize: 14,
        color: Color(0xFF5E6770),
        fontWeight: FontWeight.normal,
      );
}
