import 'package:dartz/dartz.dart';
import 'package:movies/src/erros/failure.dart';
import 'package:movies/src/models/category.dart';
import 'package:movies/src/models/movie.dart';

abstract class MoviesRepositoryInterface {
  Future<Either<List<Category>, Failure>> getCategories();
  Future<Either<List<Movie>, Failure>> searchMovies(String query);
  Future<Either<List<Movie>, Failure>> getMoviesByCategory(int categoryId);
}
