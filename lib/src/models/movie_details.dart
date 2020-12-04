import 'category.dart';
import 'companie.dart';

class MovieDetails {
  int id;
  String title;
  String originalTitle;

  String overview;
  String posterUrl;
  String backdropUrl;

  int budget;
  int runtime;
  double rated;
  DateTime releaseDate;

  List<Companie> companies;
  List<Category> categories;

  MovieDetails({
    this.id,
    this.title,
    this.rated,
    this.budget,
    this.overview,
    this.posterUrl,
    this.companies,
    this.runtime,
    this.categories,
    this.releaseDate,
    this.backdropUrl,
    this.originalTitle,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      id: json['id'],
      title: json['title'],
      budget: json['budget'],
      runtime: json['runtime'],
      overview: json['overview'],
      rated: json['vote_average'],
      posterUrl: json['poster_path'],
      backdropUrl: json['backdrop_path'],
      originalTitle: json['original_title'],
      releaseDate: DateTime.parse(json['release_date']),
      categories: json['genres'] != null
          ? (json['genres'] as List)
              .map((value) => Category.fromJson(value))
              .toList()
          : [],
      companies: json['production_companies'] != null
          ? (json['production_companies'] as List)
              .map((value) => Companie.fromJson(value))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toMap() {
    var data = Map<String, dynamic>();

    data['id'] = this.id;
    data['title'] = this.title;
    data['budget'] = this.budget;
    data['runtime'] = this.runtime;
    data['overview'] = this.overview;
    data['vote_average'] = this.rated;
    data['poster_path'] = this.posterUrl;
    data['release_date'] = this.releaseDate;
    data['backdrop_path'] = this.backdropUrl;
    data['original_title'] = this.originalTitle;
    data['genres'] = this.categories != null
        ? this.categories.map((v) => v.toMap()).toList()
        : [];
    data['production_companies'] = this.companies != null
        ? this.companies.map((v) => v.toMap()).toList()
        : [];

    return data;
  }
}
