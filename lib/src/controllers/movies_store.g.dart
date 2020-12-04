// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MoviesStore on _MoviesStoreBase, Store {
  Computed<bool> _$searchingComputed;

  @override
  bool get searching =>
      (_$searchingComputed ??= Computed<bool>(() => super.searching,
              name: '_MoviesStoreBase.searching'))
          .value;

  final _$pageAtom = Atom(name: '_MoviesStoreBase.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$searchAtom = Atom(name: '_MoviesStoreBase.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$errosAtom = Atom(name: '_MoviesStoreBase.erros');

  @override
  String get erros {
    _$errosAtom.reportRead();
    return super.erros;
  }

  @override
  set erros(String value) {
    _$errosAtom.reportWrite(value, super.erros, () {
      super.erros = value;
    });
  }

  final _$loadingAtom = Atom(name: '_MoviesStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$getMoviesAsyncAction = AsyncAction('_MoviesStoreBase.getMovies');

  @override
  Future<void> getMovies({int categoryId}) {
    return _$getMoviesAsyncAction
        .run(() => super.getMovies(categoryId: categoryId));
  }

  final _$getByCategoryChangedMoviesAsyncAction =
      AsyncAction('_MoviesStoreBase.getByCategoryChangedMovies');

  @override
  Future<void> getByCategoryChangedMovies(int index) {
    return _$getByCategoryChangedMoviesAsyncAction
        .run(() => super.getByCategoryChangedMovies(index));
  }

  final _$searchMoviesAsyncAction =
      AsyncAction('_MoviesStoreBase.searchMovies');

  @override
  Future<void> searchMovies() {
    return _$searchMoviesAsyncAction.run(() => super.searchMovies());
  }

  final _$_MoviesStoreBaseActionController =
      ActionController(name: '_MoviesStoreBase');

  @override
  void setPage(int value) {
    final _$actionInfo = _$_MoviesStoreBaseActionController.startAction(
        name: '_MoviesStoreBase.setPage');
    try {
      return super.setPage(value);
    } finally {
      _$_MoviesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearch(String value) {
    final _$actionInfo = _$_MoviesStoreBaseActionController.startAction(
        name: '_MoviesStoreBase.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_MoviesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page},
search: ${search},
erros: ${erros},
loading: ${loading},
searching: ${searching}
    ''';
  }
}
