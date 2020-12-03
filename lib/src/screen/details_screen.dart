import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/src/models/movie.dart';

import 'components/body_details.dart';
import 'components/poster_back.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;
  const DetailsScreen({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: PosterBannerBack(
                size: size,
                onTap: () => Modular.to.pop(),
              ),
            ),
            Positioned(
              top: 98,
              left: 0,
              right: 0,
              child: BodyDetails(size: size),
            ),
          ],
        ),
      ),
    );
  }
}
