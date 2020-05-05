import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/widgets/meal_item.dart';

class FavoritesPage extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesPage({Key key, @required this.favoriteMeals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? Container(
      child: Center(
        child: Text("Favorites will appear here when you have some"),
      ),
    )
        : ListView.builder(
      itemBuilder: (context, index) {
        return MealItem(
          id: favoriteMeals[index].id,
          complexity: favoriteMeals[index].complexity,
          affordability: favoriteMeals[index].affordability,
          duration: favoriteMeals[index].duration,
          imgURL: favoriteMeals[index].imageUrl,
          title: favoriteMeals[index].title,
        );
      },
      itemCount: favoriteMeals.length,
    );
  }
}
