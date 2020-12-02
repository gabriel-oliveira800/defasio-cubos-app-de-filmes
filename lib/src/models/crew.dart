class Crew {
  final int id;
  final String name;
  final String job;
  final String profile;

  const Crew({this.id, this.name,this.job, this.profile});

  factory Crew.fromJson(Map json){
    return Crew(
      id: json['id'],
      name: json['name'],
      job: json['job'],
      profile: json['profile_path'],
    );
  }

  Map<String, dynamic> toMap(){
    var data = Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['job'] = this.job;
    data['profile_path'] = this.profile;

    return data;
  }

  String toString() => name;

}