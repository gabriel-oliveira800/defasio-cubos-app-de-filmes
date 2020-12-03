import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/src/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'app_widget.dart';
import 'controllers/movies_store.dart';
import 'controllers/tab_store.dart';
import 'repositories/movies_repository_imp.dart';
import 'screen/details_screen.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds {
    return [
      Bind((i) => Dio()),
      Bind((i) => TabStore(i())),
      Bind((i) => MoviesStore(i())),
      Bind((i) => MoviesRepositoryImp(i())),
    ];
  }

  @override
  List<ModularRouter> get routers {
    return [
      ModularRouter(
        '/',
        child: (_, args) => HomeScreen(),
      ),
      ModularRouter(
        '/detaisl_movies',
        child: (_, args) => DetailsScreen(movie: args.data),
      ),
    ];
  }

  @override
  Widget get bootstrap => AppWidget();
}
