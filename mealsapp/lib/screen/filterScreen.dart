import 'package:flutter/material.dart';
import 'package:mealsapp/drawer_main.dart';

class FilterScreen extends StatefulWidget {
  static const routename = '/filter-screen';
  final Function _savefilters;
  final Map<String, bool> _currentfilters;
  FilterScreen(this._currentfilters, this._savefilters);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenfree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactosefree = false;
  @override
  void initState() {
    _glutenfree = widget._currentfilters['glutenfree'];
    _lactosefree = widget._currentfilters['lactosefree'];
    _vegan = widget._currentfilters['vegan'];
    _vegetarian = widget._currentfilters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters!'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final _filters = {
                'glutenfree': _glutenfree,
                'lactosefree': _lactosefree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget._savefilters(_filters);
            },
          ),
        ],
      ),
      drawer: Drawer_main(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Choose your filters!',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: SwitchListTile(
              title: Text('Gluten-Free'),
              value: _glutenfree,
              subtitle: Text('Will only display Gluten-free items!'),
              onChanged: (value) {
                setState(() {
                  _glutenfree = value;
                });
              },
            ),
          ),
          Expanded(
            child: SwitchListTile(
              title: Text('Lactose-Free'),
              value: _lactosefree,
              subtitle: Text('Will only display Lactose-free items!'),
              onChanged: (value) {
                setState(() {
                  _lactosefree = value;
                });
              },
            ),
          ),
          Expanded(
            child: SwitchListTile(
              title: Text('Vegan'),
              value: _vegan,
              subtitle: Text('Will only display Vegan items!'),
              onChanged: (value) {
                setState(() {
                  _vegan = value;
                });
              },
            ),
          ),
          Expanded(
            child: SwitchListTile(
              title: Text('Vegetarian'),
              value: _vegetarian,
              subtitle: Text('Will only display Vegetarian items!'),
              onChanged: (value) {
                setState(() {
                  _vegetarian = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
