import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/pages/meal_details_page.dart';
import 'package:mealsapp/widgets/recipe_attribute_widget.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgURL;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItemFunction;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imgURL,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.removeItemFunction,
  });

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailsPage.routeName, arguments: id)
        .then((returnValue) {
      if (returnValue != null) {
        removeItemFunction(returnValue);
      }
    });
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknown";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Cheap";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Expensive";
        break;
      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: Image.network(
                    imgURL,
                    height: 250.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20.0,
                  right: 10.0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    color: Colors.black38,
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26.0,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RecipeAttributeItem(
                      iconData: Icons.schedule, text: "$duration min"),
                  RecipeAttributeItem(
                      iconData: Icons.assignment_turned_in,
                      text: complexityText),
                  RecipeAttributeItem(
                      iconData: Icons.attach_money, text: affordabilityText),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
