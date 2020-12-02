import 'package:flutter/material.dart';
import 'package:movies/src/models/category.dart';

class TabCategories extends StatelessWidget {
  final int currentTabSelected;
  final Function(int) onChangedTab;
  final List<Category> categories;

  const TabCategories({
    Key key,
    @required this.categories,
    @required this.onChangedTab,
    this.currentTabSelected = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _duration = Duration(milliseconds: 300);

    return AnimatedContainer(
      duration: _duration,
      height: categories.isEmpty ? 0 :  68,
      width: categories.isEmpty ? 0: size.width,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (_, index) {
          var category = categories[index];
          return _CategoryTabItem(
            name: category.name,
            onTap: () => onChangedTab(index),
            selected: index == currentTabSelected,
          );
        },
      ),
    );
  }
}

class _CategoryTabItem extends StatelessWidget {
  final String name;
  final bool selected;
  final Function onTap;

  const _CategoryTabItem({
    Key key,
    this.onTap,
    @required this.name,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _white = Colors.white;
    final _borderColor = Color(0xFFF1F3F5);
    final _accentColor = Theme.of(context).accentColor;

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: selected ? _accentColor : _white,
          borderRadius: BorderRadius.circular(48 / 2),
          border: selected ? null : Border.all(color: _borderColor),
        ),
        constraints: BoxConstraints(minWidth: 79, maxHeight: 48),
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: selected ? _white : _accentColor,
          ),
        ),
      ),
    );
  }
}
