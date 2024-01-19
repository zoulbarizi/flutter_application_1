import 'package:flutter/material.dart';
import 'package:flutter_application_1/enter_app.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        // primaryColor: Colors.orange,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.yellow,
        ),
        useMaterial3: true,
      ),
      home: const EnterApp(),
    );
  }
}
