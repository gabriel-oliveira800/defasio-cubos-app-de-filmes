class Movie {
  int id;
  String title;
  String originalTitle;
  String backdropUrl;
  String posterUrl;
  String overview;
  double rated;
  List<int> categories;
  DateTime releaseDate;

  Movie({
    this.id,
    this.title,
    this.originalTitle,
    this.backdropUrl,
    this.posterUrl,
    this.overview,
    this.rated,
    this.categories,
    this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterUrl: json['poster_path'],
      backdropUrl: json['backdrop_path'],
      originalTitle: json['original_title'],
      rated: double.parse(json['vote_average'].toString()),
      releaseDate: DateTime.parse(json['release_date']),
      categories: json['genre_ids'] != null
          ? (json['genre_ids'] as List)
              .map<int>((genre) => int.parse(genre.toString()))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['overview'] = this.overview;
    data['vote_average'] = this.rated;
    data['genre_ids'] = this.categories;
    data['poster_path'] = this.posterUrl;
    data['release_date'] = this.releaseDate;
    data['backdrop_path'] = this.backdropUrl;
    data['original_title'] = this.originalTitle;
    return data;
  }
}
