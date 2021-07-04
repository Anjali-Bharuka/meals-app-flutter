import 'package:flutter/material.dart';
import 'package:mealsapp/screen/filterScreen.dart';

class Drawer_main extends StatelessWidget {
  WidgetbuildListTile(IconData icon, String text, Function taphandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
      ),
      title: Text(
        text,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
      onTap: taphandler,
    );
  }

  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Text(
            'Cooking yp!!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        WidgetbuildListTile(Icons.restaurant, 'Meals', () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        WidgetbuildListTile(Icons.settings, 'Filters', () {
          Navigator.of(context).pushReplacementNamed(FilterScreen.routename);
        }),
      ],
    ));
  }
}
