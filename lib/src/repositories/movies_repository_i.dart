import 'package:movies/src/models/category.dart';
import 'package:movies/src/models/movie.dart';

abstract class MoviesRepositoryInterface {
  Future<Movie> getMovies(int id);
  Future<List<Category>> getCategories();
  Future<List<Movie>> searchMovies(String query);
  Future<List<Movie>> getMoviesByCategory(int categoryId);
}
