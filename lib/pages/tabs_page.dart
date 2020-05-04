import 'package:flutter/material.dart';
import 'package:mealsapp/pages/categories_page.dart';
import 'package:mealsapp/pages/favorites_page.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final List<Map<String, dynamic>> _pages = [
    {'page': CategoriesPage(), 'title': "Categories"},
    {'page': FavoritesPage(), 'title': "Favorites"},
  ];

  int _selectedPageIndex = 0;

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
