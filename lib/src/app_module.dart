import 'package:movies/src/controllers/connection_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/src/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'repositories/movies_repository_imp.dart';
import 'controllers/movies_store.dart';
import 'controllers/tab_store.dart';
import 'screen/details/details_screen.dart';
import 'app_widget.dart';
import 'service/preferences_service_imp.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds {
    return [
      Bind((i) => TabStore(i())),
      Bind((i) => ConnectionStore()),
      Bind((i) => MoviesStore(i(), i())),
      Bind((i) => MoviesRepositoryImp(i(), i())),
      Bind((i) async => ServiceImp(await SharedPreferences.getInstance())),
      Bind((i) => Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3'))),
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
        child: (_, args) => DetailsScreen(id: args.data),
      ),
    ];
  }

  @override
  Widget get bootstrap => AppWidget();
}
