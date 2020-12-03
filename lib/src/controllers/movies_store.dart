import 'package:movies/src/repositories/movies_repository_i.dart';
import 'package:movies/src/models/category.dart';
import 'package:movies/src/models/movie.dart';
import 'package:mobx/mobx.dart';

import 'tab_store.dart';
part 'movies_store.g.dart';

class MoviesStore = _MoviesStoreBase with _$MoviesStore;

abstract class _MoviesStoreBase with Store {
  final TabStore tabStore;
  final MoviesRepositoryInterface _repository;

  _MoviesStoreBase(this._repository, this.tabStore) {
    autorun((_) {
      if (search.trim().isNotEmpty) {
       print(search);
      }
    });
  }

  @observable
  int page = 0;

  @action
  void setPage(int value) => page = value;

  @observable
  String search = '';

  @action
  void setSearch(String value) => search = value;

  @computed
  bool get searching => search != null && search.isNotEmpty;
  ObservableList<Movie> get filteredMovies => ObservableList.of(movies
      .where((value) => value.title.toLowerCase().contains(search.toLowerCase()))
      .toList());

  ObservableList<Movie> movies = ObservableList<Movie>();

  @observable
  String erros;

  @observable
  bool loading = false;

  @action
  Future<void> getMovies() async {
    loading = true;

    try {
      var result = await _repository.getMoviesByCategory(tabStore.indexTab);

      if (result != null) {
        page = result.page;
        movies = ObservableList<Movie>.of(result.movies);

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
