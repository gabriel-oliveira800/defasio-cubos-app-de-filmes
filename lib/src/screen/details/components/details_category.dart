import 'package:flutter/material.dart';
import 'package:movies/src/models/category.dart';
import 'package:movies/src/screen/components/tab_item_category.dart';

class DetailsCategory extends StatelessWidget {
  final Color color;
  final double fontSize;
  final List<Category> categories;

  const DetailsCategory({
    Key key,
    this.fontSize = 14,
    @required this.color,
    @required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: categories
            .map(
              (categorie) => getCategoryTabItem(categorie.name.toUpperCase()),
            )
            .toList(),
      ),
    );
  }

  Widget getCategoryTabItem(String name) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: CategoryTabItem(
        radius: 5,
        height: 40,
        name: name,
        padding: const EdgeInsets.all(10),
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
