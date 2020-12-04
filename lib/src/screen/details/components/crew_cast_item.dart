import 'package:flutter/material.dart';
import 'package:movies/src/models/cast.dart';
import 'package:movies/src/models/crew.dart';

class CrewCastItem extends StatelessWidget {
  final double width;
  final TextStyle styleTitle;
  final TextStyle stylesubTitle;

  final List<Cast> cats;
  final List<Crew> crews;

  const CrewCastItem({
    this.width = 120,
    this.stylesubTitle,
    @required this.cats,
    @required this.crews,
    @required this.styleTitle,
  });

  @override
  Widget build(BuildContext context) {
    final _crews = crews
        .where((value) => value.job == 'Director' || value.job == 'Screenplay')
        .toList();

    final _cats = cats.length <= 9 ? cats : cats.sublist(0, 8);

    return Container(
      width: width,
      child: Column(
        children: [
          textTitleCrewCast(title: 'Diretor'),
          Wrap(
            children: _crews
                .map((value) => textsubtitleCrewCast(subtitle: value.name))
                .toList(),
          ),
          SizedBox(height: 32),
          textTitleCrewCast(title: 'Elenco'),
          Wrap(
            children: _cats
                .map((value) => textsubtitleCrewCast(subtitle: value.name))
                .toList(),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  Widget textTitleCrewCast({String title}) {
    return Padding(
      child: Text(title, style: styleTitle),
      padding: const EdgeInsets.only(bottom: 8.0),
    );
  }

  Widget textsubtitleCrewCast({String subtitle}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(subtitle, style: stylesubTitle),
    );
  }
}
