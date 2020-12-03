import 'movie.dart';

class MoviesResults {
  int page;
  List<Movie> movies;

  MoviesResults({this.page, this.movies});

  factory MoviesResults.fromJson(Map<String, dynamic> json) {
    return MoviesResults(
      page: json['page'],
      movies: json['results'] != null
          ? (json['results'] as List).map<Movie>((movie) => Movie.fromJson(movie)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['results'] =
        this.movies != null ? this.movies.map((v) => v.toJson()).toList() : [];
    return data;
  }
}
