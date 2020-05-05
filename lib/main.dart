import 'package:flutter/material.dart';
import 'package:mealsapp/dummay_data.dart';
import 'package:mealsapp/pages/category_meals_page.dart';
import 'package:mealsapp/pages/filters_page.dart';
import 'package:mealsapp/pages/meal_details_page.dart';
import 'package:mealsapp/pages/tabs_page.dart';

import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten-free': false,
    'vegan': false,
    'vegetarian': false,
    'lactose-free': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten-free'] && !meal.isGlutenFree) {
          return false;
        }

        if (_filters['lactose-free'] && !meal.isLactoseFree) {
          return false;
        }

        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }

        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Meals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amberAccent,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData
              .light()
              .textTheme
              .copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Roboto Condensed',
                fontWeight: FontWeight.bold,
              ))),
      routes: {
        '/': (context) => TabsPage(),
        CategoryMealsPage.routeName: (context) =>
            CategoryMealsPage(
              availableMeals: _availableMeals,
            ),
        MealDetailsPage.routeName: (context) => MealDetailsPage(),
        FiltersPage.routeName: (context) =>
            FiltersPage(saveFilters: _setFilters, currentFilters: _filters),
      },
    );
  }
}
