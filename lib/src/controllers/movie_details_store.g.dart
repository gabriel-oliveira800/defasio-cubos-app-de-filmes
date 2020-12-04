// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieDetailsStore on _MovieDetailsStoreBase, Store {
  final _$movieDetailsAtom = Atom(name: '_MovieDetailsStoreBase.movieDetails');

  @override
  MovieDetails get movieDetails {
    _$movieDetailsAtom.reportRead();
    return super.movieDetails;
  }

  @override
  set movieDetails(MovieDetails value) {
    _$movieDetailsAtom.reportWrite(value, super.movieDetails, () {
      super.movieDetails = value;
    });
  }

  final _$creditsAtom = Atom(name: '_MovieDetailsStoreBase.credits');

  @override
  Credits get credits {
    _$creditsAtom.reportRead();
    return super.credits;
  }

  @override
  set credits(Credits value) {
    _$creditsAtom.reportWrite(value, super.credits, () {
      super.credits = value;
    });
  }

  final _$loadingAtom = Atom(name: '_MovieDetailsStoreBase.loading');

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

  final _$getMovieDetailsByIdAsyncAction =
      AsyncAction('_MovieDetailsStoreBase.getMovieDetailsById');

  @override
  Future<void> getMovieDetailsById(int id) {
    return _$getMovieDetailsByIdAsyncAction
        .run(() => super.getMovieDetailsById(id));
  }

  final _$getMovieCreditsAsyncAction =
      AsyncAction('_MovieDetailsStoreBase.getMovieCredits');

  @override
  Future<void> getMovieCredits() {
    return _$getMovieCreditsAsyncAction.run(() => super.getMovieCredits());
  }

  final _$_MovieDetailsStoreBaseActionController =
      ActionController(name: '_MovieDetailsStoreBase');

  @override
  void setMovieDetails(MovieDetails value) {
    final _$actionInfo = _$_MovieDetailsStoreBaseActionController.startAction(
        name: '_MovieDetailsStoreBase.setMovieDetails');
    try {
      return super.setMovieDetails(value);
    } finally {
      _$_MovieDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCredits(Credits value) {
    final _$actionInfo = _$_MovieDetailsStoreBaseActionController.startAction(
        name: '_MovieDetailsStoreBase.setCredits');
    try {
      return super.setCredits(value);
    } finally {
      _$_MovieDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movieDetails: ${movieDetails},
credits: ${credits},
loading: ${loading}
    ''';
  }
}
