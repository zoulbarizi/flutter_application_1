import 'package:flutter/material.dart';

class Foods extends StatefulWidget {
  const Foods({super.key});

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  bool isFavoris = false;

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
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          const BoxShadow(blurRadius: 5),
                        ],
                      ),
                      child: ListTile(
                        leading: Image.network(
                            "https://upload.wikimedia.org/wikipedia/commons/4/4e/McDonald%27s_Twitter_logo.png"),
                        title: const Text(
                          "Mc Donald's",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Mc Donald's"),
                            const Text("Mc Donald's"),
                            const SizedBox(height: 5),
                            Row(
                              children: [1, 2, 3, 4, 5]
                                  .map(
                                    (e) => const Icon(
                                      Icons.star,
                                      color: Colors.deepOrange,
                                      size: 15,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            isFavoris = !isFavoris;
                            setState(() {});
                          },
                          icon: Icon(
                            isFavoris ? Icons.favorite : Icons.favorite_border,
                            color: isFavoris ? Colors.deepOrange : Colors.grey,
                          ),
                        ),
                      ),
                    ),
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
