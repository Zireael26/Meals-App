import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile({IconData iconData, String text}) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.w700,
          fontSize: 24.0,
        ),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120.0,
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(height: 20),
          buildListTile(iconData: Icons.restaurant, text: "Meals"),
          buildListTile(iconData: Icons.settings, text: "Filters"),
        ],
      ),
    );
  }
}
