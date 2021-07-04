import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favoritemeals;
  FavoritesScreen(this._favoritemeals);
  @override
  Widget build(BuildContext context) {
    if (_favoritemeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return Meal_item(
            id: _favoritemeals[index].id,
            title: _favoritemeals[index].title,
            imageUrl: _favoritemeals[index].imageUrl,
            duration: _favoritemeals[index].duration,
            affordability: _favoritemeals[index].affordability,
            complexity: _favoritemeals[index].complexity,
          );
        },
        itemCount: _favoritemeals.length,
      );
    }
  }
}
