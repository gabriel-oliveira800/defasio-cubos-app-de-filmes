import 'package:movies/src/repositories/movies_repository_imp.dart';
import 'package:movies/src/models/movie_details.dart';
import 'package:movies/src/models/movies_result.dart';
import 'package:movies/src/models/category.dart';
import 'package:movies/src/models/credits.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/src/erros/failure.dart';
import 'package:movies/src/models/movie.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import '../data/data.dart';

class DioMock extends Mock implements Dio {}

main() {
  var dio = DioMock();
  var repository = MoviesRepositoryImp(dio);

  group('Test in Category', () {
    test('must obtain a list of Category', () async {
      when(dio.get(any)).thenAnswer((_) async =>
          Response(data: jsonDecode(rawCategories), statusCode: 200));

      var future = repository.getCategories();
      expect(future, completes);

      var result = await future;
      expect(result, isA<List<Category>>());
      expect(result[2].id, equals(16));
    });

    test('should return a ResponseError if status code equal 401', () async {
      when(dio.get(any))
          .thenAnswer((_) async => Response(data: null, statusCode: 401));

      var result = repository.getCategories();
      expect(result, throwsA(isA<ResponseError>()));
    });
  });

  group('Testando MoviesResults:', () {
    test('deve retorna um MovieResult de por categorias', () async {
      when(dio.get(any)).thenAnswer((_) async =>
          Response(data: jsonDecode(rawMoviesByCategory), statusCode: 200));

      var result = repository.getMoviesByCategory(28);
      expect(result, completes);
      expect(await result, isA<MoviesResults>());
    });

    test('deve retorna um MovieResult de por categorias na proxima página',
        () async {
      when(dio.get(any)).thenAnswer((_) async => Response(
          data: jsonDecode(rawMoviesByCategoryPaginate), statusCode: 200));

      var result = repository.getMoviesByCategory(28, page: 2);
      expect(result, completes);

      expect(await result, isA<MoviesResults>());

      var resultModel = await result;
      expect(resultModel.page, equals(2));
    });

    test('deve retorna um ResponseError se statusCode !=  200', () async {
      when(dio.get(any))
          .thenAnswer((_) async => Response(data: null, statusCode: 401));

      var result = repository.getMoviesByCategory(28);
      expect(result, throwsA(isA<ResponseError>()));
    });
  });

  group('Testando MoviesDetails: ', () {
    test('deve retorna um MoviesDetails pelo id', () async {
      when(dio.get(any)).thenAnswer((_) async =>
          Response(data: jsonDecode(rawMovieDetails), statusCode: 200));

      var future = repository.getMovieDetails(550);
      expect(future, completes);

      var result = await future;
      expect(result, isA<MovieDetails>());
      expect(result.id, equals(550));
    });

    test('deve retorna um ResponseError se statusCode !=  200', () async {
      when(dio.get(any))
          .thenAnswer((_) async => Response(data: null, statusCode: 401));

      var result = repository.getMovieDetails(550);
      expect(result, throwsA(isA<ResponseError>()));
    });
  });

  group('Testando a Buscar de Filmes: ', () {
    test('deve retorna uma lista de Movies pela buscar', () async {
      when(dio.get(any)).thenAnswer((_) async =>
          Response(statusCode: 200, data: jsonDecode(rawMoviesSearch)));

      var future = repository.searchMovies('vingadores');
      expect(future, completes);

      var result = await future;
      expect(result, isA<List<Movie>>());
      expect(result[0].id, equals(24428));
    });

    test('deve retorna um ResponserErro se query == null ou vazio', () async {
      var result = repository.searchMovies(null);
      expect(result, throwsA(isA<ResponseError>()));

      result = repository.searchMovies('');
      expect(result, throwsA(isA<ResponseError>()));
    });
  });

  group('Testando a Creditos dos Filmes: ', () {
    test('deve retorna Credits do filme com id == 550', () async {
      when(dio.get(any)).thenAnswer((_) async =>
          Response(statusCode: 200, data: jsonDecode(rawMoviesCredits)));

      var future = repository.getCreditsByMovieId(10);
      expect(future, completes);

      var result = await future;
      expect(result, isA<Credits>());
      expect(result.id, equals(550));
    });

    test('deve retorna um ResponserErro caso statuscode != 200', () async {
       when(dio.get(any))
          .thenAnswer((_) async => Response(data: null, statusCode: 401));

      var result = repository.getCreditsByMovieId(10);
      expect(result, throwsA(isA<ResponseError>()));
    });
  });
}
