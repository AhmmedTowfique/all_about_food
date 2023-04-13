import 'package:all_about_food/dummy_data.dart';
import 'package:all_about_food/models/category.dart';
import 'package:all_about_food/models/meal.dart';
import 'package:all_about_food/screens/meals.dart';
import 'package:all_about_food/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key, required this.onToggledFavorite, required this.availableMeals}) : super(key: key);
  final void Function(Meal) onToggledFavorite;
  final List<Meal> availableMeals;
  void _selectCategory(BuildContext context, Category category) {
    var filteredMeals = availableMeals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: category.title, meals: filteredMeals, onToggledFavorite: onToggledFavorite))); //Navigator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 3 / 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
      children: [
        //if we use map [] braces should be removed and set that  children:availableCategories.map((catData) => CategoryGridItem(category:catData)).toList()
        //availableCategories.map((catData) => CategoryGridItem(category:catData)).toList()
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onCategorySelected: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
