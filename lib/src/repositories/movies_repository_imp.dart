import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:movies/src/models/movies_result.dart';
import 'package:movies/src/utils/constants.dart';
import 'package:movies/src/models/category.dart';
import 'package:movies/src/erros/failure.dart';
import 'package:movies/src/utils/api_key.dart';
import 'package:movies/src/models/movie.dart';
import 'movies_repository_i.dart';
import 'package:dio/dio.dart';

class MoviesRepositoryImp implements MoviesRepositoryInterface {
  final Dio dio;

  const MoviesRepositoryImp(this.dio);

  @override
  Future<Movie> getMovies(int id) async {
    var response =
        await dio.get('/genre/movie/$id?api_key=$apiKey&language=pt-BR');

    if (response.statusCode == 200) {
      return Movie.fromJson(response.data);
    } else {
      throw ResponseError(message: 'Não foi possivél carrega as categorias');
    }
  }

  @override
  Future<List<Category>> getCategories() async {
    final preferences = await SharedPreferences.getInstance();

    if (preferences.containsKey(keysCategories)) {
      var data = json.decode(preferences.get(keysCategories));
      return (data as List).map((json) => Category.fromJson(json)).toList();
    }

    var response =
        await dio.get('/genre/movie/list?api_key=$apiKey&language=pt-BR');

    if (response.statusCode == 200) {
      final data = response.data['genres'];

      await preferences.setString(keysCategories, json.encode(data));

      return (data as List).map((json) => Category.fromJson(json)).toList();
    } else {
      throw ResponseError();
    }
  }

  @override
  Future<MoviesResults> getMoviesByCategory(int id, {int page = 1}) async {
    Map<String, dynamic> query = {
      'page': page,
      'api_key': apiKey,
      'with_genres': '28',
      'sort_by': 'popularity.desc',
    };

    var response = await dio.get('/discover/movie', queryParameters: query);

    if (response.statusCode == 200) {
      return MoviesResults.fromJson(response.data);
    } else {
      throw ResponseError(message: 'Error ao carregar os filmes');
    }
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    throw UnimplementedError();
  }
}
