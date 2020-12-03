import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movies/src/controllers/movies_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/src/controllers/tab_store.dart';
import 'package:flutter/material.dart';

import 'components/body_home.dart';
import 'components/header_app.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  var tabStore = Modular.get<TabStore>();
  var moviesStore = Modular.get<MoviesStore>();

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 0, end: 1.0).animate(controller);

    controller.forward();
    moviesStore.getMovies();
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
              child: Observer(
                builder: (_) => BodyHome(
                  movies: moviesStore.movies,
                  loading: moviesStore.loading,
                  categories: tabStore.categories,
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                child: HeaderApp(
                  tabstore: tabStore,
                  animation: animation,
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
}
