import 'package:flutter/material.dart';

import 'foods.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController pswController = TextEditingController();
  bool pswObscure = true;

  @override
  void dispose() {
    loginController.dispose();
    pswController.dispose();
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
              "Sign In",
              style: TextStyle(fontSize: 30),
            ),
            Image.asset("assets/images/logo_travel.png"),
            Text("data data data data data data data data data "),
            SizedBox(height: 20),
            TextField(
              controller: loginController,
              decoration: InputDecoration(
                hintText: "Login",
                labelText: "Votre login",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: pswController,
              obscureText: pswObscure,
              decoration: InputDecoration(
                hintText: "Mot de passe",
                labelText: "Votre mot de passe",
                prefixIcon: Icon(Icons.lock),
                suffix: InkWell(
                  child: Icon(
                    pswObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                  onTap: () {
                    setState(() {
                      pswObscure = !pswObscure;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Submit"),
              onPressed: () {
                String login = loginController.text;
                String psw = pswController.text;

                debugPrint("login = $login");
                debugPrint("psw = $psw");

                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const Foods()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
