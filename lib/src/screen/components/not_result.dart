import 'package:flutter/material.dart';
import 'package:movies/src/utils/constants.dart';

class NotResult extends StatelessWidget {
  final Size size;
  final String text;
  final IconData icon;
  final Widget child;

  const NotResult({
    Key key,
    this.text,
    this.child,
    @required this.size,
    this.icon = Icons.slow_motion_video,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: size.height * 0.35,
            color: titleColor ?? Theme.of(context).accentColor,
          ),
          Container(
            width: size.width * 85,
            child: Text(
              text ?? '',
              style: TextStyle(
                fontSize: 16,
                color: titleColor,
                fontWeight: FontWeight.normal,
              ),
            ),
            padding: const EdgeInsets.all(18.0),
          ),
          child ?? Container(),
        ],
      ),
    );
  }
}
