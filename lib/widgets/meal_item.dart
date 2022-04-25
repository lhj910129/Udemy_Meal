import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screen/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  MealItem(
      {Key? key,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.removeItem})
      : super(key: key);

  //난이도를 텍스트로 가져오기 위한 겟
  String get complexityText {
    String result;

    switch (complexity) {
      case Complexity.Simple:
        result = 'Simple';
        break;
      case Complexity.Challenging:
        result = 'Challenging';
        break;
      case Complexity.Hard:
        result = 'Hard';
        break;
      default:
        result = 'Unknown';
    }
    return result;
  }

  //가격을 텍스트로 가져오기 위한 겟
  String get affordabilityText {
    String result;

    switch (affordability) {
      case Affordability.Affordable:
        result = 'Affordable';
        break;
      case Affordability.Luxurious:
        result = 'Luxurious';
        break;
      case Affordability.Pricey:
        result = 'Pricey';
        break;
      default:
        result = 'Unknown';
    }
    return result;
  }

  //음식을 선택하면 디테일화면을 호출
  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    )
        .then((result) {
      /*
      puchNamed는 Future타입
      디테일 화면을 호출이 끝난 뒤에 then이 실행된다.
      뒤로가기버튼으로 이화면으로 왔을때는 전달한 값이 없다!
      */
      if (result != null) {
        removeItem(result);
      }
      print(result);
    });

    /*
    해당위젯의 routeName을 지정할때 Static으로 선언하고, 
    Main.dart에 등록하고,  
    호출할 곳에서 RouteName을 사용하여 호출한다.
    */
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  /*위치를 지정할 수 있는 위젯*/
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true /*텍스트 래핑*/,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround, //가로 위치를 균등하게 맞춤
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
