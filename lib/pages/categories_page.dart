import 'package:flutter/material.dart';
import 'package:mealsapp/dummay_data.dart';
import 'package:mealsapp/widgets/category_item.dart';

class CategoriesPage extends StatelessWidget {
//  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25.0),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES
          .map((catData) =>
          CategoryItem(
            catData.id,
            catData.title,
            catData.color,
          ))
          .toList(),
    );
  }
}
