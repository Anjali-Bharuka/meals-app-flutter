import 'package:flutter/material.dart';
import '../dummy_data.dart';

class meals_details extends StatelessWidget {
  final Function _checkfavorite;
  final Function _isfavorite;
  meals_details(this._checkfavorite, this._isfavorite);
  static const routename = '/meals-details';
  Widget buildTitle(String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget builddetails(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedmeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.network(
                selectedmeal.imageUrl,
                fit: BoxFit.cover,
              ),
              height: 300,
              width: double.infinity,
            ),
            buildTitle('Ingredients', context),
            builddetails(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Text(selectedmeal.ingredients[index]),
                ),
                itemCount: selectedmeal.ingredients.length,
              ),
            ),
            buildTitle('Steps', context),
            builddetails(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${(index + 1)}'),
                    ),
                    title: Text(selectedmeal.steps[index]),
                  ),
                  Divider(),
                ],
              ),
              itemCount: selectedmeal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          _isfavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => _checkfavorite(mealId),
      ),
    );
  }
}
