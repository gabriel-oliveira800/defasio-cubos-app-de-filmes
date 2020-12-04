import 'dart:convert';

import 'package:movies/src/models/movies_result.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:movies/src/models/category.dart';
import 'preferences_service.dart';

class ServiceImp implements Service {
  @override
  Future<List<Category>> getCategories(String key) async {
    final preferences = await SharedPreferences.getInstance();

    if (!preferences.containsKey(key)) return null;

    var data = json.decode(preferences.get(key));
    return (data as List).map((json) => Category.fromJson(json)).toList();
  }

  @override
  Future<MoviesResults> getMovies(String key) async {
    final preferences = await SharedPreferences.getInstance();

    if (!preferences.containsKey(key)) return null;

    var data = json.decode(preferences.get(key));
    return MoviesResults.fromJson(data);
  }

  @override
  Future<bool> putCategories(String key, dynamic data) async {
    final preferences = await SharedPreferences.getInstance();

    return await preferences.setString(key, json.encode(data));
  }

  @override
  Future<bool> putMovies(String key, dynamic data) async {
    final preferences = await SharedPreferences.getInstance();

    return await preferences.setString(key, json.encode(data));
  }
}
