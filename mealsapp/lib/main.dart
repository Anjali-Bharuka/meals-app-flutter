import 'package:flutter/material.dart';
import 'package:mealsapp/dummy_data.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/screen/filterScreen.dart';
import 'package:mealsapp/screen/tabsScreen.dart';
import './screen/meals_details.dart';
import 'screen/categorymeals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutenfree': false,
    'lactosefree': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availablemeal = DUMMY_MEALS;
  List<Meal> _favoritemeal = [];
  void _setfilter(Map<String, bool> filterdata) {
    setState(() {
      _filters = filterdata;
      _availablemeal = DUMMY_MEALS.where((meal) {
        if (filterdata['glutenfree'] && !meal.isglutenfree) return false;
        if (filterdata['lactosefree'] && !meal.islactosefree) return false;
        if (filterdata['vegan'] && !meal.isVegan) return false;
        if (filterdata['vegetarian'] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  void _checkfavorites(String mealid) {
    final _existingindex =
        _favoritemeal.indexWhere((meal) => meal.id == mealid);
    if (_existingindex >= 0) {
      setState(() {
        _favoritemeal.removeAt(_existingindex);
      });
    } else {
      setState(() {
        _favoritemeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealid));
      });
    }
  }

  bool _isfavorite(String id) {
    return _favoritemeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: CategoriesScreen(),]
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favoritemeal),
        CategorymealsScreen.routename: (ctx) =>
            CategorymealsScreen(_availablemeal),
        meals_details.routename: (ctx) =>
            meals_details(_checkfavorites, _isfavorite),
        FilterScreen.routename: (ctx) => FilterScreen(_filters, _setfilter),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (ctx) => CategorymealsScreen(_availablemeal));
      },
    );
  }
}
