import 'package:flutter/material.dart';

class PosterBannerBack extends StatelessWidget {
  final double width;
  final double height;
  final Function onTap;

  final Animation<double> opacity;
  final Animation<double> position;

  const PosterBannerBack({
    Key key,
    @required this.onTap,
    @required this.width,
    @required this.height,
    @required this.opacity,
    @required this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _backgroundColor = Color(0xFFF5F5F5);

    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        color: _backgroundColor,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topLeft,
          children: [
            Positioned(
              top: 0,
              left: position.value *  -38,
              child: Container(
                width: 86,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(86 / 2),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      spreadRadius: -10,
                      offset: Offset(0, 10),
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ],
                  border: Border.all(color: Color(0xFFFAFAFA)),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned(
                      bottom: position.value * -80,
                      child: Opacity(
                        opacity: opacity.value,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 18,
                              color: Color(0xFF6D7070),
                            ),
                            Text(
                              'Voltar',
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xFF6D7070),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      ),
    );
  }
}
