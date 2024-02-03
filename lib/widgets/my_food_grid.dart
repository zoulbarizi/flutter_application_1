import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/food.dart';
import 'package:flutter_application_1/views/food_details.dart';

class MyFoodGrid extends StatefulWidget {
  // const MyFoodGrid(
  //     {super.key,
  //     required this.title,
  //     required this.subtitle,
  //     this.image,
  //     required this.stars,
  //     required this.favorit});

  // final String title, subtitle;
  // final String? image;
  // final int stars;
  // final bool favorit;

  final Food food;

  const MyFoodGrid({super.key, required this.food});

  @override
  State<MyFoodGrid> createState() => _MyFoodGridState();
}

class _MyFoodGridState extends State<MyFoodGrid> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(
        children: [
          Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.network(
                      widget.food.image ??
                          "https://upload.wikimedia.org/wikipedia/commons/4/4e/McDonald%27s_Twitter_logo.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  widget.food.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(widget.food.subtitle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [1, 2, 3, 4, 5]
                      .map(
                        (e) => Icon(
                          Icons.star,
                          size: 15,
                          color:
                              e <= widget.food.stars ? Colors.red : Colors.grey,
                        ),
                      )
                      .toList(),
                ),
                // SizedBox(height: 5),
              ],
            ),
          ),
          Positioned(
            top: 8,
            left: 10,
            child: SizedBox(
              width: 30,
              height: 30,
              child: FloatingActionButton(
                child: Icon(Icons.favorite, size: 20),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FoodDetails(food: widget.food),
        ));
      },
    );
  }
}
