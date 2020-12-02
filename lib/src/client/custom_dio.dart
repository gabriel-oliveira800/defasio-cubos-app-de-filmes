import 'package:dio/dio.dart';

class CustomDio {
  final Dio instance;

  CustomDio(this.instance){
    this.instance.options.baseUrl = 'https://api.themoviedb.org/3/';
  }
}