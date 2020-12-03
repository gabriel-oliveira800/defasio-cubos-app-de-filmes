class Companie {
  int id;
  String name;
  String logoUrl;
  String originCountry;

   Companie({this.id, this.name, this.logoUrl, this.originCountry});

  factory Companie.fromJson(Map json){
    return Companie(
      id: json['id'],
      name: json['name'],
      logoUrl: json['logo_path'],
      originCountry: json['origin_country']
    );
  }

  Map<String, dynamic> toMap(){
    var data = Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;

    return data;
  }

  String toString() => name;
}