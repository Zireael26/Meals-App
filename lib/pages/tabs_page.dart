import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/pages/categories_page.dart';
import 'package:mealsapp/pages/favorites_page.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class TabsPage extends StatefulWidget {
  final List<Meal> favoriteMealsList;

  const TabsPage({Key key, this.favoriteMealsList}) : super(key: key);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  List<Map<String, dynamic>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': CategoriesPage(), 'title': "Categories"},
      {
        'page': FavoritesPage(favoriteMeals: widget.favoriteMealsList),
        'title': "Favorites"
      },
    ];
  }

  _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme
            .of(context)
            .primaryColor,
        currentIndex: _selectedPageIndex,
//        type: BottomNavigationBarType.shifting,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favorites"),
          ),
        ],
      ),
    );
  }
}
