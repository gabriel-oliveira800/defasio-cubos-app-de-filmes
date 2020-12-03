import 'package:flutter/material.dart';
import 'package:movies/src/utils/constants.dart';

class NotResult extends StatelessWidget {
  final Size size;
  final String title;
  final IconData icon;
  final Widget child;

  const NotResult({
    Key key,
    this.child,
    @required this.size,
    this.icon = Icons.slow_motion_video,
    this.title = 'Nenhum resultado encontrado',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: size.height * 0.4,
          color: Theme.of(context).accentColor,
        ),
        SizedBox(height: 38),
        Text(
          title ?? '',
          style: TextStyle(
            fontSize: 18,
            color: titleColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        child ?? Container(),
      ],
    );
  }
}
