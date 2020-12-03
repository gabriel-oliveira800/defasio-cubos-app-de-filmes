import 'package:movies/src/repositories/movies_repository_i.dart';
import 'package:movies/src/models/category.dart';
import 'package:movies/src/models/movie.dart';
import 'package:mobx/mobx.dart';
part 'movies_store.g.dart';

class MoviesStore = _MoviesStoreBase with _$MoviesStore;

abstract class _MoviesStoreBase with Store {
  final MoviesRepositoryInterface _repository;

  _MoviesStoreBase(this._repository) {
    autorun((_) {
      if (!search.trim().isNotEmpty) {
        searchMovies();
      }
    });
  }

  @observable
  String search = '';

  @action
  void setSearch(String value) => search = value;

  @observable
  int page = 0;

  @action
  void setPage(int value) => page = value;

  @observable
  Category currentCategory;

  @action
  void setCurrentCategory(Category value) => currentCategory = value;

  ObservableList<Movie> movies = ObservableList<Movie>();

  @observable
  String erros;

  @observable
  bool loading = false;

  @action
  Future<void> getMovies() async {
    loading = true;

    try {
      var result = await _repository.getMoviesByCategory(currentCategory.id);

      if (result != null) {
        page = result.page;
        movies = result.movies;

        erros = null;
        loading = false;
      }
    } catch (e) {
      loading = false;
      erros = 'Falha ao carregar filmes, por favor tente novamente mais tarde.';
    }
  }

  @action
  Future<void> searchMovies() async {}
}
