class Movie {
  int id;
  String title;
  String posterUrl;
  String backdropUrl;
  String originalTitle;
  List<int> categories;

  Movie({
    this.id,
    this.title,
    this.posterUrl,
    this.categories,
    this.backdropUrl,
    this.originalTitle,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      posterUrl: json['poster_path'],
      backdropUrl: json['backdrop_path'],
      originalTitle: json['original_title'],
      categories: json['genre_ids'] != null
          ? (json['genre_ids'] as List)
              .map((value) => int.parse(value.toString()))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toMap() {
    var data = Map<String, dynamic>();

    data['id'] = this.id;
    data['title'] = this.title;
    data['genre_ids'] = this.categories;
    data['poster_path'] = this.posterUrl;
    data['backdrop_path'] = this.backdropUrl;
    data['original_title'] = this.originalTitle;
    
    return data;
  }
}
