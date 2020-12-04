import 'package:mobx/mobx.dart';
import 'package:movies/src/controllers/connection_store.dart';
import 'package:movies/src/controllers/movie_details_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/src/utils/constants.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movies/src/models/movie.dart';
import 'package:flutter/material.dart';

import 'components/buget_companies.dart';
import 'components/media_movie.dart';
import 'components/title_movie.dart';
import 'components/wrapper_box.dart';
import 'components/poster_back.dart';
import 'components/rated_movie.dart';
import 'components/crew_cast_item.dart';
import 'components/details_category.dart';
import 'components/movie_description.dart';
import '../home/components/image_banner.dart';

class DetailsScreen extends StatefulWidget {
  final Movie currentMovie;
  const DetailsScreen({@required this.currentMovie});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  Movie get currentMovie => widget.currentMovie;

  Animation<double> opacity;
  Animation<double> position;
  AnimationController controller;

  ReactionDisposer _disposer;
  var store = Modular.get<MovieDetailsStore>();
  var connectionStore = Modular.get<ConnectionStore>();

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this,
    );

    position = Tween<double>(begin: 1, end: 0).animate(controller);
    opacity = Tween<double>(begin: 0, end: 1.0).animate(controller);

    controller.forward();

    store.getMovieDetailsById(currentMovie.id);

    _disposer = reaction(
      (_) => connectionStore.stream.value,
      (_) => connectionStore.showNetWorkingOn(context),
    );
  }

  @override
  void dispose() {
    _disposer();
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _colorTitle = Color(0xFF5E6770);
    final _colorsubTitle = Color(0xFF343A40);

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AnimatedBuilder(
                animation: controller,
                builder: (context, child) => PosterBannerBack(
                  height: 280,
                  opacity: opacity,
                  width: size.width,
                  position: position,
                  onTap: () => Modular.to.pop(),
                ),
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
                        tag: currentMovie.posterUrl,
                        imageUrl: baseUrlImages + currentMovie.posterUrl,
                      ),
                    ),
                  ],
                ),
              ),
              Observer(
                builder: (_) => Padding(
                  child: store.hasData
                      ? RatedMovie(
                          rated: store.movieDetails.rated.toStringAsFixed(2),
                        )
                      : WrapperBox(width: 130),
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                ),
              ),
              Text(
                currentMovie.title,
                textAlign: TextAlign.center,
                style: _descriptionStyle.copyWith(
                  fontSize: 20,
                  color: _colorTitle,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 12),
              TitleMovie(
                style: _descriptionStyle,
                title: currentMovie.originalTitle.toUpperCase(),
              ),
              SizedBox(height: 12),
              Observer(
                builder: (_) => store.hasData
                    ? MediaMovieWrapper(
                        runtime: store.movieDetails.runtime,
                        date: store.movieDetails.releaseDate,
                      )
                    : Padding(
                        child: WrapperBox(),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      ),
              ),
              SizedBox(height: 12),
              Observer(
                builder: (_) => store.hasData
                    ? DetailsCategory(
                        color: _colorsubTitle,
                        categories: store.movieDetails.categories,
                      )
                    : Padding(
                        child: WrapperBox(),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      ),
              ),
              SizedBox(height: 63),
              Observer(
                builder: (_) => store.hasData
                    ? MovieDescription(
                        width: size.width,
                        title: 'Descrição',
                        overview: store.movieDetails.overview,
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
                      )
                    : Padding(
                        child: WrapperBox(),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      ),
              ),
              SizedBox(height: 40),
              Observer(
                builder: (_) {
                  final hasCompanies = store.movieDetails?.companies == null ||
                      store.movieDetails.companies.isEmpty;

                  return store.hasData
                      ? BudgetCompanies(
                          budget: store.movieDetails.budget,
                          companie: !hasCompanies
                              ? store.movieDetails.companies.first
                              : null,
                        )
                      : Padding(
                          child: WrapperBox(),
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        );
                },
              ),
              SizedBox(height: 40),
              Observer(
                builder: (_) => store.hasDataCredits
                    ? Padding(
                        child: CrewCastItem(
                          crews: store.credits.crew,
                          cats: store.credits.casts,
                          width: size.width,
                          styleTitle: TextStyle(
                            fontSize: 14,
                            color: _colorTitle,
                            fontWeight: FontWeight.normal,
                          ),
                          stylesubTitle: TextStyle(
                            fontSize: 12,
                            color: _colorsubTitle,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                      )
                    : Padding(
                        child: WrapperBox(),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      ),
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
