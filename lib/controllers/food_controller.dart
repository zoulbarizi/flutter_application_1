import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/models/food.dart';

class FoodController {
  var db = FirebaseFirestore.instance.collection("Foods");

  addFood(Food food) async {
    await db.add(food.toJson());
  }

  Future<List<Food>> getFoods() async {
    var myFoods = await db.get();

    return myFoods.docs
        .map((e) => Food(
              id: e.id,
              title: e.data()['title'],
              subtitle: e.data()['subtitle'],
              details: e.data()['details'],
              stars: e.data()['stars'],
              favorit: e.data()['favorit'],
              image: e.data()['image'],
            ))
        .toList();
  }
}
