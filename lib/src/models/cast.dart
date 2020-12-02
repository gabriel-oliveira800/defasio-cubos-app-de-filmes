class Cast {
  final int id;
  final String name;
  final String profile;

  const Cast({this.id, this.name, this.profile});

  factory Cast.fromJson(Map json){
    return Cast(
      id: json['id'],
      name: json['name'],
      profile: json['profile_path'],
    );
  }

  Map<String, dynamic> toMap(){
    var data = Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['profile_path'] = this.profile;

    return data;
  }

  String toString() => name;

}