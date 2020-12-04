import 'package:movies/src/models/category.dart';
import 'package:movies/src/models/movies_result.dart';

abstract class Service {
  static final String keysMovies = 'MOVIES';
  static final String keysCategories = 'CATEGORIES';

  Future<bool> putMovies(String key, dynamic data);
  Future<bool> putCategories(String key, dynamic data);

  Future<MoviesResults> getMovies(String key);
  Future<List<Category>> getCategories(String key);
}
