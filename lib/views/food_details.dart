import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/food.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({super.key, required this.food});
  final Food food;

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.food.title)),
      body: Center(
        child: Image.network(
          widget.food.image ??
              "https://upload.wikimedia.org/wikipedia/commons/4/4e/McDonald%27s_Twitter_logo.png",
        ),
      ),
    );
  }
}
