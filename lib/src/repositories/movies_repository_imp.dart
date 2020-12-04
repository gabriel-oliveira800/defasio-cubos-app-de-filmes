import 'dart:convert';

import 'package:movies/src/models/credits.dart';
import 'package:movies/src/models/movie_details.dart';
import 'package:movies/src/service/preferences_service.dart';
import 'package:movies/src/service/preferences_service_imp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:movies/src/models/movies_result.dart';
import 'package:movies/src/models/category.dart';
import 'package:movies/src/erros/failure.dart';
import 'package:movies/src/utils/api_key.dart';
import 'package:movies/src/models/movie.dart';
import 'movies_repository_i.dart';
import 'package:dio/dio.dart';

class MoviesRepositoryImp implements MoviesRepositoryInterface {
  final Dio dio;
  final ServiceImp service;

  const MoviesRepositoryImp(this.dio, this.service);

  @override
  Future<MovieDetails> getMovieDetails(int id) async {
    Map<String, dynamic> query = {'api_key': apiKey, 'language': 'pt-BR'};

    var response = await dio.get('/movie/$id', queryParameters: query);

    if (response.statusCode == 200) {
      return MovieDetails.fromJson(response.data);
    } else {
      throw ResponseError(message: 'Não foi possivél carrega as categorias');
    }
  }

  @override
  Future<List<Category>> getCategories() async {
    var result = await service.getCategories(Service.keysCategories);
    if (result != null) return result;

    Map<String, dynamic> query = {'api_key': apiKey, 'language': 'pt-BR'};

    var response = await dio.get('/genre/movie/list', queryParameters: query);

    if (response.statusCode == 200) {
      final data = response.data['genres'];

      await service.putCategories(Service.keysCategories, data);

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
      'with_genres': id,
      'language': 'pt-BR',
      'sort_by': 'popularity.desc'
    };

    var response = await dio.get('/discover/movie', queryParameters: query);

    if (response.statusCode == 200) {
      return MoviesResults.fromJson(response.data);
    } else {
      throw ResponseError(message: 'Error ao carregar os filmes');
    }
  }

  @override
  Future<List<Movie>> searchMovies(String search) async {
    if (search == null || search.trim().isEmpty)
      throw ResponseError(message: 'Search não pode ser nula');

    Map<String, dynamic> query = {
      'query': search,
      'api_key': apiKey,
      'language': 'pt-BR'
    };

    var response = await dio.get('/search/movie', queryParameters: query);

    if (response.statusCode == 200) {
      final data = response.data['results'];
      return (data as List).map((json) => Movie.fromJson(json)).toList();
    } else {
      throw ResponseError(message: 'Error ao buscar os filmes');
    }
  }

  @override
  Future<Credits> getCreditsByMovieId(int id) async {
    Map<String, dynamic> query = {'api_key': apiKey, 'language': 'pt-BR'};

    var response = await dio.get('/movie/$id/credits', queryParameters: query);

    if (response.statusCode == 200) {
      return Credits.fromJson(response.data);
    } else {
      throw ResponseError(message: 'Error ao buscar os créditos');
    }
  }
}
