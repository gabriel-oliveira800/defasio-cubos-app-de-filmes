import 'package:movies/src/models/movie.dart';
import 'package:movies/src/repositories/movies_repository_imp.dart';
import 'package:movies/src/models/category.dart';
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

  test('must obtain a list of Category', () async {
    when(dio.get(any)).thenAnswer((_) async =>
        Response(data: jsonDecode(categoriesTeste), statusCode: 200));

    var result = repository.getCategories();
    expect(result, completes);
    expect(await result, isA<List<Category>>());
  });

  test('should return a ResponseError if status code equal 401', () async {
    when(dio.get(any))
        .thenAnswer((_) async => Response(data: null, statusCode: 401));

    var result = repository.getCategories();
    expect(result, throwsA(isA<ResponseError>()));
  });

  test('must obtain a Movies', () async {
    when(dio.get(any)).thenAnswer((_) async =>
        Response(data: jsonDecode(moviesTeste), statusCode: 200));

    var result = repository.getMovies(550);
    expect(result, completes);
    expect(await result, isA<Movie>());
  });
}
