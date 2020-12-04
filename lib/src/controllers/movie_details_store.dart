import 'package:movies/src/repositories/movies_repository_i.dart';
import 'package:movies/src/models/movie_details.dart';
import 'package:movies/src/models/credits.dart';
import 'package:mobx/mobx.dart';
part 'movie_details_store.g.dart';

class MovieDetailsStore = _MovieDetailsStoreBase with _$MovieDetailsStore;

abstract class _MovieDetailsStoreBase with Store {
  final MoviesRepositoryInterface _repository;
  _MovieDetailsStoreBase(this._repository);

  @observable
  MovieDetails movieDetails;

  @action
  void setMovieDetails(MovieDetails value) => movieDetails = value;

  @observable
  Credits credits;

  @action
  void setCredits(Credits value) => credits = value;

  @observable
  bool loading = false;

  @action
  Future<void> getMovieDetailsById(int id) async {
    loading = true;

    try {
      var result = await _repository.getMovieDetails(id);

      if (result != null) movieDetails = result;

      loading = false;
    } catch (e) {
      loading = false;
    }
  }

  @action
  Future<void> getMovieCredits() async {
    if (movieDetails != null) {
      loading = true;

      try {
        var result = await _repository.getCreditsByMovieId(movieDetails.id);

        if (result != null) credits = result;

        loading = false;
      } catch (e) {
        loading = false;
      }
    }
  }
}
