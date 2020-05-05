import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersPage(
      {Key key, @required this.saveFilters, @required this.currentFilters})
      : super(key: key);

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool _glutenFree;
  bool _vegan;
  bool _vegetarian;
  bool _lactoseFree;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFree = widget.currentFilters['gluten-free'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose-free'];
  }

  Widget _buildSwitchListTile({@required String titleText,
    @required String subtitleText,
    @required Function onChanged,
    @required bool currentValue}) {
    return SwitchListTile(
      title: Text(titleText),
      subtitle: Text(subtitleText),
      value: currentValue,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten-free': _glutenFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
                'lactose-free': _lactoseFree,
              };

              widget.saveFilters(selectedFilters);

              Navigator.of(context).pushReplacementNamed('/');
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Adjust your meal selection",
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  titleText: "Gluten Free",
                  subtitleText: "Only display meals that are gluten free",
                  onChanged: (bool newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                  currentValue: _glutenFree,
                ),
                _buildSwitchListTile(
                  titleText: "Vegan",
                  subtitleText:
                  "Only display meals that are meat and dairy free",
                  onChanged: (bool newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                  currentValue: _vegan,
                ),
                _buildSwitchListTile(
                  titleText: "Vegetarian",
                  subtitleText: "Only display meals that are meat free",
                  onChanged: (bool newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                  currentValue: _vegetarian,
                ),
                _buildSwitchListTile(
                  titleText: "Lactose Free",
                  subtitleText: "Only display meals that are dairy free",
                  onChanged: (bool newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                  currentValue: _lactoseFree,
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
