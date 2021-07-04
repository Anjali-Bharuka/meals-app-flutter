import 'package:flutter/material.dart';
import '../drawer_main.dart';
import '../screen/favorites_screen.dart';
import '../screen/categories_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favoritemeal;
  TabsScreen(this._favoritemeal);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages;
  int _selectedindex = 0;
  void _selectbar(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  void initState() {
    pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavoritesScreen(widget._favoritemeal),
        'title': 'Your favorites!'
      },
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[_selectedindex]['title']),
      ),
      drawer: Drawer_main(),
      body: pages[_selectedindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectbar,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedindex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorities'),
          ),
        ],
      ),
    );
  }
}
