import 'package:flutter/material.dart';

class CategoryTabItem extends StatelessWidget {
  final String name;
  final bool selected;
  final Function onTap;

  final double width;
  final double height;
  final double radius;
  final TextStyle style;
  final EdgeInsetsGeometry padding;

  const CategoryTabItem({
    Key key,
    this.onTap,
    this.width,
    this.style,
    this.radius,
    this.padding,
    this.height = 48,
    @required this.name,
    this.selected = false,
  }) : assert(height != null);

  @override
  Widget build(BuildContext context) {
    final _white = Colors.white;
    final _borderColor = Color(0xFFF1F3F5);
    final _accentColor = Theme.of(context).accentColor;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: selected ? _accentColor : _white,
          borderRadius: BorderRadius.circular(radius ?? height / 2),
          border: selected ? null : Border.all(color: _borderColor),
        ),
        alignment: Alignment.center,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          name,
          style: style ??
              TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: selected ? _white : _accentColor,
              ),
        ),
      ),
    );
  }
}
