import 'cast.dart';
import 'crew.dart';

class Credits {
  final int id;
  final List<Cast> casts;
  final List<Crew> crew;

  const Credits({this.id, this.casts, this.crew});

  factory Credits.fromJson(Map json) {
    return Credits(
      id: json['id'],
      crew: json['crew'] == null
          ? []
          : (json['crew'] as List)
              .map((value) => Crew.fromJson(value))
              .toList(),
      casts: json['cast'] == null
          ? []
          : (json['cast'] as List)
              .map((value) => Cast.fromJson(value))
              .toList(),
    );
  }

  Map<String, dynamic> toMap() {
    var data = Map<String, dynamic>();

    data['id'] = this.id;
    data['crew'] = this.crew;
    data['casts'] = this.casts;

    return data;
  }
}
