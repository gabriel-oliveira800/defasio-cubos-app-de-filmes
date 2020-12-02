import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds {
    return [
      Bind((i) => Dio()),
    ];
  }

  @override
  List<ModularRouter> get routers {
    return [];
  }

  @override
  Widget get bootstrap => AppWidget();

}