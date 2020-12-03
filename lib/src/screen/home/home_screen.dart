import 'package:movies/src/controllers/connection_store.dart';
import 'package:movies/src/controllers/movies_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'components/body_home.dart';
import 'components/header_app.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  ReactionDisposer _disposer;
  Animation<double> animation;
  AnimationController controller;

  var moviesStore = Modular.get<MoviesStore>();
  var connectionStore = Modular.get<ConnectionStore>();

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 0, end: 1.0).animate(controller);

    controller.forward();
    moviesStore.getMovies();

    _disposer = reaction(
      (_) => connectionStore.stream.value,
      (_) => connectionStore.showNetWorkingOn(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 128,
              bottom: 0,
              child: Observer(
                builder: (_) => BodyHome(
                  movies: moviesStore.searching
                      ? moviesStore.filteredMovies
                      : moviesStore.movies,
                  error: moviesStore.erros,
                  loading: moviesStore.loading,
                  onRefresh: moviesStore.getMovies,
                  categories: moviesStore.tabStore.categories,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                child: HeaderApp(
                  animation: animation,
                  tabstore: moviesStore.tabStore,
                  onChanged: moviesStore.setSearch,
                ),
                padding: const EdgeInsets.all(12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }
}
