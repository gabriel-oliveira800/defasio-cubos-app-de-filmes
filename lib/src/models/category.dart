class Category {
  final int id;
  final String name;

  const Category({this.id, this.name});

  factory Category.fromJson(Map json){
    return Category(
      id: json['id'],
      name: json['name']
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
