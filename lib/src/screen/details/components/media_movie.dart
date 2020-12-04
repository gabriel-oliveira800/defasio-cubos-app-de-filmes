import 'package:flutter/material.dart';

import 'year_time.dart';

class MediaMovieWrapper extends StatelessWidget {
  final int runtime;
  final DateTime date;

  const MediaMovieWrapper({
    Key key,
    @required this.date,
    @required this.runtime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final time = TimeOfDay(
      hour: (runtime / 60).round(),
      minute: (runtime % 60),
    );

    return Padding(
      child: Row(
        children: [
          YearTimeMovie(
            title: '${date.year}',
            subtitle: 'ano: ',
          ),
          Spacer(),
          YearTimeMovie(
            subtitle: 'duração: ',
            title: (time.hour > 0 ? '${time.hour}h ' : '') +
                (time.minute > 0 ? '${time.minute} min' : ''),
          )
        ],
      ),
      padding: const EdgeInsets.only(left: 44, top: 18, right: 44, bottom: 12),
    );
  }
}
