import 'category.dart';
import 'companie.dart';

class Movie {
  final int id;
  final String title;
  final double rated;
  final double budget;
  final double runtime;

  final String poster;
  final String overview;
  final DateTime releaseDate;
  final String originalTitle;

  final List<Companie> companies;
  final List<Category> categories;

  const Movie({
    this.id,
    this.title,
    this.rated,
    this.budget,
    this.poster,
    this.runtime,
    this.overview,
    this.companies,
    this.categories,
    this.releaseDate,
    this.originalTitle,
  });

  factory Movie.fromJson(Map json) {
    var genres = json['genres'] == null
        ? <Category>[]
        : (json['genres'] as List)
            .map((value) => Category.fromJson(value))
            .toList();

    var data = json['production_companies'] == null
        ? <Companie>[]
        : (json['production_companies'] as List)
            .map((value) => Companie.fromJson(value))
            .toList();

    return Movie(
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      rated: json['vote_average'],
      budget: json['budget'],
      runtime: json['runtime'],
      poster: json['backdrop_path'],
      overview: json['overview'],
      releaseDate: DateTime.parse(json['release_date']),
      categories: genres,
      companies: data,
    );
  }

  Map<String, dynamic> toMap() {
    var data = Map<String, dynamic>();

    data['id'] = this.id;
    data['title'] = this.title;
    data['original_title'] = this.originalTitle;
    data['vote_average'] = this.rated;
    data['budget'] = this.budget;
    data['runtime'] = this.runtime;
    data['backdrop_path'] = this.poster;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['genres'] = this.categories;
    data['production_companies'] = this.companies;

    return data;
  }
}
