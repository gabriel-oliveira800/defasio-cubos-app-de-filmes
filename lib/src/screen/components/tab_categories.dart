import 'package:flutter/material.dart';
import 'package:movies/src/models/category.dart';

import 'tab_item_category.dart';

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
            child: CategoryTabItem(
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

