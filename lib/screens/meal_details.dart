import 'package:all_about_food/models/meal.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({Key? key, required this.meal}) : super(key: key);
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 14,),
            for(final ingredients in meal.ingredients)
              Text(ingredients,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
            const SizedBox(height: 24,),
            for(final ingredients in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 12),
                child: Text(ingredients,textAlign:TextAlign.center,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground),),
              ),
          ],
        ),
      ),
    );
  }
}
