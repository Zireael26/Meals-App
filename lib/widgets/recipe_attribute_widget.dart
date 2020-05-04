import 'package:flutter/material.dart';

class RecipeAttributeItem extends StatelessWidget {
  final IconData iconData;
  final String text;

  RecipeAttributeItem({this.iconData, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(iconData),
        SizedBox(width: 6.0),
        Text(text),
      ],
    );
  }
}
