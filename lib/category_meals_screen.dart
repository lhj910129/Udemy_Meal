import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
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
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle.toString(),
        ),
      ),
      body: Container(
        child: Text(
          '이 카테고리의 레시피들이 표시되는 화면입니다.',
        ),
      ),
    );
  }
}
