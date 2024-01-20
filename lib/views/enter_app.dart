import 'dart:async';

import 'package:flutter/material.dart';

import 'login.dart';

class EnterApp extends StatefulWidget {
  const EnterApp({super.key});

  @override
  State<EnterApp> createState() => _EnterAppState();
}

class _EnterAppState extends State<EnterApp> {
  TextStyle myTextStyle() => const TextStyle(
        color: Colors.white,
        fontSize: 20,
      );

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Login()),
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/logo_travel.png",
          width: size.width * .5,
          height: size.height / 10,
          fit: BoxFit.cover,
        ),
      ),
      // body: Container(
      //   width: double.infinity,
      //   decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //       colors: [
      //         Color.fromARGB(255, 0, 101, 184),
      //         Color.fromARGB(255, 0, 48, 107),
      //         Color.fromARGB(255, 0, 36, 80),
      //       ],
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter,
      //     ),
      //     // color: Color(0xFF020024),
      //   ),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     // crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Image.asset(
      //         "assets/images/logo_travel.png",
      //         color: Colors.white,
      //         width: size.width * .5,
      //         height: size.height / 10,
      //         fit: BoxFit.cover,
      //       ),
      //       SizedBox(height: 20),
      //       Text("Find Your dream", style: myTextStyle()),
      //       Text("Destination with us", style: myTextStyle()),
      //       SizedBox(height: 20),
      //       ElevatedButton.icon(
      //         onPressed: () {
      //           Navigator.of(context).push(
      //             MaterialPageRoute(
      //               builder: (context) => const Foods(),
      //             ),
      //           );
      //         },
      //         label: Text(
      //           "Continuer",
      //           style: myTextStyle(),
      //         ),
      //         icon: Icon(Icons.travel_explore_rounded),
      //         style: ElevatedButton.styleFrom(
      //           backgroundColor: Colors.teal,
      //           foregroundColor: Colors.black,
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.zero,
      //           ),
      //         ),
      //       ),
      //       // TextButton(
      //       //   onPressed: () {},
      //       //   child: Text("Cliquez ici"),
      //       // ),
      //     ],
      //   ),
      //   // child: ListView(
      //   //   children: [
      //   //     ListTile(
      //   //       leading: Image.asset(
      //   //         "assets/images/logo_travel.png",

      //   //       ),
      //   //       title: const Text("Titre"),
      //   //       subtitle: const Text("Sous titre"),
      //   //       trailing: IconButton(
      //   //         onPressed: () {},
      //   //         icon: const Icon(Icons.chevron_right),
      //   //       ),
      //   //     ),
      //   //   ],
      //   // ),
      // ),
    );
  }
}
