import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';
import '../dummy_data.dart';

class CategorymealsScreen extends StatefulWidget {
  //final String Categoryid;
  //final String Categorytitle;
  //CategorymealsScreen(this.Categoryid, this.Categorytitle);
  static const routename = '/category-meals';
  final List<Meal> _todisplaymeals;
  CategorymealsScreen(this._todisplaymeals);
  @override
  _CategorymealsScreenState createState() => _CategorymealsScreenState();
}

class _CategorymealsScreenState extends State<CategorymealsScreen> {
  String Categoryid;
  String Categorytitle;
  var _loadedinitdata = false;
  List<Meal> CategoryMeals;
  @override
  @override
  void didChangeDependencies() {
    if (!_loadedinitdata) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final Categoryid = routeArgs['id'];
      Categorytitle = routeArgs['title'];
      CategoryMeals = widget._todisplaymeals.where((meal) {
        return meal.categories.contains(Categoryid);
      }).toList();
      _loadedinitdata = true;
    }
    super.didChangeDependencies();
  }

  void _removeItem(mealid) {
    setState(() {
      CategoryMeals.removeWhere((meal) => meal.id == mealid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Categorytitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Meal_item(
            id: CategoryMeals[index].id,
            title: CategoryMeals[index].title,
            imageUrl: CategoryMeals[index].imageUrl,
            duration: CategoryMeals[index].duration,
            affordability: CategoryMeals[index].affordability,
            complexity: CategoryMeals[index].complexity,
          );
        },
        itemCount: CategoryMeals.length,
      ),
    );
  }
}
