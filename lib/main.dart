import 'package:flutter/material.dart';
import 'package:mealsapp/pages/categories_page.dart';
import 'package:mealsapp/pages/category_meals_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        CategoriesPage.routeName: (context) => CategoriesPage(),
        CategoryMealsPage.routeName: (context) => CategoryMealsPage()
      },
    );
  }
}
