import 'package:flutter/material.dart';
import './dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(
  //   this.categoryId,
  //   this.categoryTitle,
  // );

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoryId);
    }).toList(); //카테고리아이디를 가진 리스트만 가져온다
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle.toString(),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Text(categoryMeals[index].title);
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
