import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/ob_model.dart';
import 'package:flutter_application_1/views/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController controller = PageController(initialPage: 0);
  int page = 0;

  List<ObModel> slides = [
    ObModel(
      title: "Explore with just one tap",
      image: "assets/images/ob1.png",
      description:
          "Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre",
    ),
    ObModel(
      title: "Let us suggest you",
      image: "assets/images/ob2.png",
      description:
          "Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre ",
    ),
    ObModel(
      title: "Tast it at home",
      image: "assets/images/ob3.png",
      description:
          "Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre ",
    ),
  ];

  myButtons() {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            controller.previousPage(
              duration: Duration(seconds: 1),
              curve: Curves.easeInExpo,
            );
          },
          child: Text("Préc."),
        ),
        // Text("${controller.page?.toInt()}"),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: slides
                .map(
                  (e) => Container(
                    width: 8,
                    height: 8,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: page == slides.indexOf(e)
                          ? Colors.amber
                          : Colors.grey,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        page == slides.length - 1
            ? ElevatedButton(
                onPressed: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool("isFirstTime", false);
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                    (route) => false,
                  );
                },
                child: Text("Terminer"),
              )
            : TextButton(
                onPressed: () {
                  controller.nextPage(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                  );
                },
                child: Text("Suiv."),
              ),
      ],
    );
  }

  Widget obTile(ObModel ob) => Column(
        children: [
          Expanded(
            child: Image.asset(ob.image, fit: BoxFit.contain),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              ob.title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              ob.description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              children: slides.map((e) => obTile(e)).toList(),
              onPageChanged: (value) {
                setState(() => page = value);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: myButtons(),
          )
        ],
      ),
    );
  }
}
