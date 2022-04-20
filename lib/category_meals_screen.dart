import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '레시피',
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
