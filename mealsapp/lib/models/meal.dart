import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}
enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final String title;
  final List<String> ingredients;
  final List<String> categories;
  final String imageUrl;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isglutenfree;
  final bool islactosefree;
  final bool isVegan;
  final bool isVegetarian;
  const Meal({
    @required this.id,
    @required this.title,
    @required this.ingredients,
    @required this.categories,
    @required this.imageUrl,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isglutenfree,
    @required this.islactosefree,
    @required this.isVegan,
    @required this.isVegetarian,
  });
}
