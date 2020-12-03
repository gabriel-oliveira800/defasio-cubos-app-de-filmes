import 'package:movies/src/models/movies_result.dart';
import 'package:movies/src/repositories/movies_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/src/erros/failure.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import '../data/data.dart';

class DioMock extends Mock implements Dio {}

main() {
  var dio = DioMock();
  var repository = MoviesRepositoryImp(dio);

  // group('Test in Category', () {
  //   test('must obtain a list of Category', () async {
  //     when(dio.get(any)).thenAnswer((_) async =>
  //         Response(data: jsonDecode(categoriesTeste), statusCode: 200));

  //     var result = repository.getCategories();
  //     expect(result, completes);
  //     expect(await result, isA<List<Category>>());
  //   });

  //   test('should return a ResponseError if status code equal 401', () async {
  //     when(dio.get(any))
  //         .thenAnswer((_) async => Response(data: null, statusCode: 401));

  //     var result = repository.getCategories();
  //     expect(result, throwsA(isA<ResponseError>()));
  //   });
  // });

  group('Testando MoviesResults: ', () {
    test('deve retorna um MovieResult de por categorias', () async {
      when(dio.get(any)).thenAnswer((_) async =>
          Response(data: jsonDecode(moviesTeste), statusCode: 200));

      var result = repository.getMoviesByCategory(28);
      expect(result, completes);
      expect(await result, isA<MoviesResults>());
    });

    test('deve retorna um MovieResult de por categorias na proxima página',
        () async {
      when(dio.get(any)).thenAnswer((_) async =>
          Response(data: jsonDecode(moviesTestePaginate), statusCode: 200));

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
}
