import 'package:movies/src/models/category.dart';
import 'package:movies/src/models/movie.dart';

abstract class Service {
  static final String keysMovies = 'MOVIES';
  static final String keysCategories = 'CATEGORIES';

  Future<bool> putMovies(String key, dynamic data);
  Future<bool> putCategories(String key, dynamic data);

  Future<List<Movie>> getMovies(String key);
  Future<List<Category>> getCategories(String key);
}
