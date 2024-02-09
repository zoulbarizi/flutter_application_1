import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/user_auth/firebase_auth_implementation/firabase_auth_services.dart';
import 'package:flutter_application_1/controllers/food_controller.dart';
import 'package:flutter_application_1/models/food.dart';
import 'package:flutter_application_1/views/login.dart';

import 'foods.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageLinkController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    subtitleController.dispose();
    descriptionController.dispose();
    imageLinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              "Sign Up",
              style: TextStyle(fontSize: 30),
            ),
            Image.asset("assets/images/logo_travel.png"),
            Text(
                "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Asperiores deserunt consectetur ethic est? Ullam sit alias fuga laboriosam deserunt provident obcaecati ea consequuntur dicta tenetur, dolorem inventore eos magni? "),
            SizedBox(height: 20),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "titre",
                labelText: "Nom du plat",
                prefixIcon: Icon(Icons.food_bank_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: subtitleController,
              decoration: InputDecoration(
                hintText: "subtitre",
                labelText: "SOutitre du plat",
                prefixIcon: Icon(Icons.food_bank_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: descriptionController,
              minLines: 3,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Description",
                labelText: "Descripion de votre plat",
                prefixIcon: Icon(Icons.info),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: imageLinkController,
              decoration: InputDecoration(
                hintText: "Photo du plat",
                labelText: "Lien de l'image",
                prefixIcon: Icon(Icons.food_bank_rounded),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                child: Text("Ajouter le plat"),
                onPressed: () {
                  addFood();
                }),
            SizedBox(height: 10),
            Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Foods()),
                  );
                },
                child: Text(
                  "Back",
                  style: TextStyle(color: Colors.amber),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addFood() async {
    String title = titleController.text;
    String subtitle = subtitleController.text;
    String details = descriptionController.text;
    String imgLink = imageLinkController.text;

    await FoodController().addFood(
      Food(
        title: title,
        subtitle: subtitle,
        details: details,
        stars: 0,
        favorit: false,
        image: imgLink,
      ),
    );

    // User? user = await _auth.addFoodWithEmailAndPassword(title,subtitle);

    // if (user != null) {
    //   print("User is successfully created");
    //   Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => const Login()),
    //     (route) => false,
    //   );
    // } else {
    //   print("Something went wrong");
    // }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Votre plat a été ajouté avec succès"),
      ),
    );

    Navigator.of(context).pop();
  }
}
