import 'package:flutter/material.dart';
import 'package:mealsapp/dummay_data.dart';
import 'package:mealsapp/widgets/category_item.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deli Meals'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(25.0),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map((catData) => CategoryItem(
          catData.title,
          catData.color,
        ))
            .toList(),
      ),
    );
  }
}