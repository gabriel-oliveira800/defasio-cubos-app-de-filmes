import 'package:movies/src/erros/failure.dart';
import 'package:movies/src/models/category.dart';
import 'package:movies/src/utils/api_key.dart';
import 'package:movies/src/models/movie.dart';
import 'movies_repository_i.dart';
import 'package:dio/dio.dart';

class MoviesRepositoryImp implements MoviesRepositoryInterface {
  final Dio dio;
  const MoviesRepositoryImp(this.dio);

  final url = 'https://api.themoviedb.org/3';

  @override
  Future<Movie> getMovies(int id) async {
    final endPointer = '$url/genre/movie/$id?api_key=$apiKey&language=pt-BR';
    var response = await dio.get(endPointer);

    if (response.statusCode == 200) {
      return Movie.fromJson(response.data);
    } else {
      throw ResponseError();
    }
  }

  @override
  Future<List<Category>> getCategories() async {
    final endPointer = '$url/genre/movie/list?api_key=$apiKey&language=pt-BR';

    var response = await dio.get(endPointer);

    if (response.statusCode == 200) {
      final data = response.data['genres'] as List;
      return data.map((json) => Category.fromJson(json)).toList();
    } else {
      throw ResponseError();
    }
  }

  @override
  Future<List<Movie>> getMoviesByCategory(int categoryId) async {
    final endPointer = '$url/discover/movie?api_key=$apiKey&language=pt-BR';
    final query = '&sort_by=popularity.desc&page=1&with_genres=$categoryId';

    var response = await dio.get('$endPointer$query');

    if (response.statusCode == 200) {
      final data = response.data['results'] as List;
      return data.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw ResponseError();
    }
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    throw UnimplementedError();
  }
}
