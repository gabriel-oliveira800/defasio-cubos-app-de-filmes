import 'package:movies/src/models/category.dart';
import 'package:movies/src/models/credits.dart';
import 'package:movies/src/models/movie.dart';
import 'package:movies/src/models/movie_details.dart';
import 'package:movies/src/models/movies_result.dart';

abstract class MoviesRepositoryInterface {
  Future<List<Category>> getCategories();
  Future<Credits> getCreditsByMovieId(int id);
  Future<MovieDetails> getMovieDetails(int id);
  Future<List<Movie>> searchMovies(String search);
  Future<MoviesResults> getMoviesByCategory(int id, {int page = 1});
}
