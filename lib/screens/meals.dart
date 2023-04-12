import 'package:all_about_food/widgets/meal_item.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';
import 'meal_details.dart';

class Meals extends StatelessWidget {
  final String title;
  final List<Meal> meals;
  void selectMeal(BuildContext context, Meal meal){
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MealDetailsScreen( meal: meal)));
  }
  const Meals({Key? key, required this.title, required this.meals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemBuilder: (ctx, index) => MealItem(meal: meals[index],onSelectMeal:selectMeal ),
      itemCount: meals.length,
    );
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Uh oh ... nothing here', style:
            Theme.of(context).textTheme.headlineLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
            const SizedBox(height: 16),
            Text(
              'Try selecting a different category!',
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
