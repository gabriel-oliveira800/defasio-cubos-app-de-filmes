import 'package:movies/src/models/category.dart';
import 'package:movies/src/models/movie.dart';
import 'package:movies/src/models/movies_result.dart';

abstract class MoviesRepositoryInterface {
  Future<Movie> getMovies(int id);
  Future<List<Category>> getCategories();
  Future<List<Movie>> searchMovies(String query);
  Future<MoviesResults> getMoviesByCategory(int id, {int page = 0});
}
