import 'package:anime_navigation/data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = '/meal-detail';
  Widget buildTitle(String title, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title + ' :',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildBlock(Widget child, BuildContext context) {
    return Container(
      height: 200,
      width: 370,
      padding: EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedMeal.title}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildTitle('Igredients', context),
              buildBlock(
                  ListView.builder(
                    itemBuilder: (context, index) => Row(
                      children: [
                        Icon(Icons.arrow_right),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(selectedMeal.ingredients[index]),
                        ),
                      ],
                    ),
                    itemCount: selectedMeal.ingredients.length,
                  ),
                  context),
              buildTitle('Steps', context),
              buildBlock(
                  ListView.builder(
                    itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${(index + 1)}'),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(selectedMeal.steps[index]),
                      ),
                    ),
                    itemCount: selectedMeal.steps.length,
                  ),
                  context),
            ],
          ),
        ));
  }
}
