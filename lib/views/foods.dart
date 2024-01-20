import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/food.dart';
import 'package:flutter_application_1/widgets/my_food.dart';

class Foods extends StatefulWidget {
  const Foods({super.key});

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  bool isFavoris = false;

  // List<Map<String, dynamic>> myFoodData = [
  //   {
  //     "title": "Riz noir",
  //     "subtitle": "subtitle",
  //     "stars": 5,
  //     "favorit": true,
  //     "image":
  //         "https://cac.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fcac.2F2018.2F09.2F25.2F166ce1c3-9452-4422-94e0-9c8c7ddc0090.2Ejpeg/750x562/quality/80/crop-from/center/cr/wqkgTGF1cmVudCBSb3V2cmFpcy9QcmlzbWFwaXggLyBDdWlzaW5lIEFjdHVlbGxl/salade-de-riz-noir-a-la-grenade-et-aux-pignons.jpeg",
  //   },
  //   {
  //     "title": "Riz au gras",
  //     "subtitle": "subtitle",
  //     "stars": 4,
  //     "favorit": false,
  //     "image":
  //         "https://img.freepik.com/free-photo/big-sandwich-hamburger-with-juicy-beef-burger-cheese-tomato-red-onion-wooden-table_2829-19631.jpg",
  //   },
  //   {
  //     "title": "Riz bleu",
  //     "subtitle": "subtitle",
  //     "stars": 4,
  //     "favorit": true,
  //     "image":
  //         "https://static.750g.com/images/1200-675/ea621fd21d03206d1b53937c1400f089/risotto-bleu-au-roquefort-et-aux-poires.jpeg",
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://img.freepik.com/psd-gratuit/menu-nourriture-modele-banniere-web-delicieuses-pizzas_106176-419.jpg",
            ),
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Column(
          children: [
            Container(
              height: size.height / 4,
              padding: const EdgeInsets.only(top: 20),
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                      size: 40,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  // children: myFoodData
                  //     .map(
                  //       (e) => MyFood(
                  //         title: e["title"],
                  //         subtitle: e["subtitle"],
                  //         stars: e["stars"],
                  //         image: e["image"],
                  //       ),
                  //     )
                  //     .toList(),
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.deepOrange,
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.info_outline),
                          Text("tititle"),
                          Spacer(),
                          Text("Read more"),
                          Icon(Icons.arrow_right_alt_sharp),
                        ],
                      ),
                    ),
                    // ...myFoodData
                    //     .map(
                    //       (e) => MyFood(
                    //         title: e["title"],
                    //         subtitle: e["subtitle"],
                    //         stars: e["stars"],
                    //         image: e["image"],
                    //         favorit: e["favorit"],
                    //       ),
                    //     )
                    //     .toList(),

                    // ...myFoods.map((e) => MyFood(
                    // title: e["title"],
                    //         subtitle: e["subtitle"],
                    //         stars: e["stars"],
                    //         image: e["image"],
                    //         favorit: e["favorit"],
                    // )).toList()

                    ...myFoods.map((e) => MyFood(food: e)).toList()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
