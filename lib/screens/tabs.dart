import 'package:all_about_food/models/meal.dart';
import 'package:all_about_food/screens/categories.dart';
import 'package:all_about_food/screens/meals.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectPageIndex = index;
    });
  }

  final List<Meal> _favoriteMeals = [];

  void _toggleMealFavoriteStatus(Meal meal) {
    var _isExisting = _favoriteMeals.contains(meal);
    setState(() {
      if (_isExisting) {
        _favoriteMeals.remove(meal);
        _showInfoMessage('Meal is no longer a favorite');
      } else {
        _favoriteMeals.add(meal);
        _showInfoMessage('Marked as favorite');
      }
    });
  }
  void _showInfoMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(onToggledFavorite: _toggleMealFavoriteStatus);
    var activePageTitle = 'Categories';
    if (_selectPageIndex == 1) {
      activePage =  MealsScreen( meals: _favoriteMeals, onToggledFavorite: _toggleMealFavoriteStatus,);
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectPageIndex,
        onTap: (index) {
          _selectPage(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Catagories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
