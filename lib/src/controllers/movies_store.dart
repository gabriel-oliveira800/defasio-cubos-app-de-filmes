import 'package:movies/src/repositories/movies_repository_i.dart';
import 'package:movies/src/service/preferences_service.dart';
import 'package:movies/src/service/preferences_service_imp.dart';
import 'package:movies/src/models/movie.dart';
import 'package:mobx/mobx.dart';

import 'connection_store.dart';
import 'tab_store.dart';
part 'movies_store.g.dart';

class MoviesStore = _MoviesStoreBase with _$MoviesStore;

abstract class _MoviesStoreBase with Store {
  final TabStore tabStore;
  final ServiceImp _service;
  final ConnectionStore connection;
  final MoviesRepositoryInterface _repository;

  _MoviesStoreBase(
    this._repository,
    this.tabStore,
    this.connection,
    this._service,
  ) {
    getMovies();

    autorun(
      (_) {
        if (search.trim().isNotEmpty) searchMovies();
      },
      delay: 2000,
    );
  }

  @observable
  int page = 0;

  @action
  void setPage(int value) => page = value;

  @observable
  String search = '';

  @action
  void setSearch(String value) => search = value;

  ObservableList<Movie> movies = ObservableList<Movie>();

  @observable
  String erros;

  @observable
  bool loading = false;

  @action
  Future<void> getMovies({int categoryId}) async {
    loading = true;

    if (!connection.connected) {
      _getMoviesCacheByService();
      loading = false;
      return;
    }

    try {
      var result = await _repository.getMoviesByCategory(categoryId ?? 28);

      if (result != null) {
        page = result.page;
        movies = ObservableList<Movie>.of(result.movies);

        await _service.putMovies(Service.keysMovies, result.toMap());

        erros = null;
        loading = false;
      }
    } catch (e) {
      loading = false;
      erros = 'Falha ao carregar filmes, por favor tente novamente mais tarde';
    }
  }

  @action
  Future<void> searchMovies() async {
    loading = true;

    try {
      var result = await _repository.searchMovies(search);

      if (result != null) {
        movies = ObservableList<Movie>.of(result);
        erros = null;
      }

      loading = false;
    } catch (e) {
      print(e);
      loading = false;
      erros = 'Falha ao carregar filmes, por favor tente novamente mais tarde';
    }
  }

  @action
  Future<void> getByCategoryChangedMovies(int index) async {
    tabStore.setCurrentTab(index);
    await getMovies(categoryId: tabStore.getCurrentTab.id);
  }

  @action
  Future<void> _getMoviesCacheByService() async {
    var result = await _service.getMovies(Service.keysMovies);

    if (result == null) {
      erros = 'Falha ao carregar filmes, por favor tente novamente mais tarde';
    } else {
      page = result.page;
      movies = ObservableList<Movie>.of(result.movies);

      erros = null;
    }
  }
}
