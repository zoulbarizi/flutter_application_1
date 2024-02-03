import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  myContainer() {
    return Container(
      height: 150,
      width: 250,
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        // shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.red,
            blurRadius: 8,
            spreadRadius: 3,
            // offset: Offset(-10, 20),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Mon Appli"),
          centerTitle: true,
          // toolbarHeight: 300,
          actions: [
            IconButton(
              onPressed: () {
                debugPrint("Mes notifs");
              },
              icon: const Icon(Icons.notifications),
            ),
            IconButton(
              onPressed: () {
                debugPrint("Mes notifs");
              },
              icon: const Icon(Icons.person),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const Text("data"),
              const Text("data"),
              const Text("data"),
              const Text("data"),
              const Text("data"),
              const Text("data"),
              const Text("data"),
              const Text("data"),
            ],
          ),
        ),
        body: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            myContainer(),
            myContainer(),
            myContainer(),
            myContainer(),
            myContainer(),
            myContainer(),
          ],
        ));
  }
}
