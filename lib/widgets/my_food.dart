import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/food.dart';
import 'package:flutter_application_1/views/food_details.dart';

class MyFood extends StatefulWidget {
  // const MyFood(
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

  const MyFood({super.key, required this.food});

  @override
  State<MyFood> createState() => _MyFoodState();
}

class _MyFoodState extends State<MyFood> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          const BoxShadow(blurRadius: 5),
        ],
      ),
      child: ListTile(
        leading: Image.network(
          widget.food.image ??
              "https://upload.wikimedia.org/wikipedia/commons/4/4e/McDonald%27s_Twitter_logo.png",
          width: 80,
          fit: BoxFit.cover,
        ),
        title: Text(
          widget.food.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.food.subtitle),
            const SizedBox(height: 5),
            Row(
              children: [1, 2, 3, 4, 5]
                  .map(
                    (e) => Icon(
                      Icons.star,
                      size: 15,
                      color: e <= widget.food.stars ? Colors.red : Colors.grey,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            // isFavoris = !isFavoris;
            // setState(() {});
          },
          icon: Icon(
            widget.food.favorit ? Icons.favorite : Icons.favorite_border,
            color: widget.food.favorit ? Colors.deepOrange : Colors.grey,
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FoodDetails(food: widget.food),
          ));
        },
      ),
    );
  }
}
