import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:movies/src/models/category.dart';
import 'package:movies/src/models/movie.dart';
import 'preferences_service.dart';

class ServiceImp implements Service {
  final SharedPreferences preferences;
  const ServiceImp(this.preferences);

  @override
  Future<List<Category>> getCategories(String key) async {
    if (!preferences.containsKey(key)) return null;

    var data = json.decode(preferences.get(key));
    return (data as List).map((json) => Category.fromJson(json)).toList();
  }

  @override
  Future<List<Movie>> getMovies(String key) async {
    if (!preferences.containsKey(key)) return null;

    var data = json.decode(preferences.get(key));
    return (data as List).map((json) => Movie.fromJson(json)).toList();
  }

  @override
  Future<bool> putCategories(String key, dynamic data) async {
    return await preferences.setString(key, json.encode(data));
  }

  @override
  Future<bool> putMovies(String key, dynamic data) async {
    return await preferences.setString(key, json.encode(data));
  }
}
