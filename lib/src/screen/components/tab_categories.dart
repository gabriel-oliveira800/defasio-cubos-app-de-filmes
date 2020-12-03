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
      height: 48,
      width: size.width,
      duration: _duration,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          var category = categories[index];
          return Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              right: 8.0,
            ),
            child: _CategoryTabItem(
              name: category.name,
              onTap: () => onChangedTab(index),
              selected: index == currentTabSelected,
            ),
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
