import 'package:flutter/material.dart';
import 'package:meals/screen/meal_detail_screen.dart';
import 'package:meals/screen/tabs_screen.dart';
import 'screen/category_meals_screen.dart';
import 'screen/categories_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeal',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyMedium: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleMedium: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: CategoriesScreen(),
      initialRoute: '/', //디폴트값 '/'
      routes: {
        '/': (ctx) => TabsScreen(), //home
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      onGenerateRoute: (settings) {
        //그냥 route와 무슨 차이가 있는지... 앱의 규모가 커지면 적절히 사용한다고 함
      },
      onUnknownRoute: (settings) {
        //아무 route를 지정하지 않았을때... unknown으로 지정됨. 보통 시작페이지나 에러페이지에 주로 사용함
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
