import 'package:movies/src/repositories/movies_repository_i.dart';
import 'package:movies/src/models/movie.dart';
import 'package:mobx/mobx.dart';
import 'package:movies/src/service/preferences_service.dart';
import 'package:movies/src/service/preferences_service_imp.dart';

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
  bool get searching => search != null && search.trim().isNotEmpty;
  ObservableList<Movie> get filteredMovies => ObservableList.of(movies
      .where(
          (value) => value.title.toLowerCase().contains(search.toLowerCase()))
      .toList());

  ObservableList<Movie> movies = ObservableList<Movie>();

  @observable
  String erros;

  @observable
  bool loading = false;

  @action
  Future<void> getMovies({int categoryId}) async {
    loading = true;

    if (!connection.connected) {
      return _getMoviesCacheByService();
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
  Future<void> getByCategoryChangedMovies(int index) async {
    tabStore.setCurrentTab(index);
    await getMovies(categoryId: tabStore.getCurrentTab.id);
  }

  @action
  Future<void> _getMoviesCacheByService() async {
    try {
      var result = await _service.getMovies(Service.keysMovies);

      if (result == null) {
        erros = 'Por favor, ligue os dados móveis ou conecte-se ao wi-fi';
        return;
      }

      page = result.page;
      movies = ObservableList<Movie>.of(result.movies);

      erros = null;
      loading = false;
    } catch (e) {
      loading = false;
      erros = 'Error desconhecido: ${e?.message}';
    }
  }

  @action
  Future<void> searchMovies() async {}
}
