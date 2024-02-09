import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/user_auth/firebase_auth_implementation/firabase_auth_services.dart';
import 'package:flutter_application_1/views/signUp.dart';

import 'foods.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loading = false;
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool pswObscure = true;

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
            Image.asset(
              "assets/images/logo_travel.png",
              color: Colors.amber,
            ),
            Text("data data data data data data data data data "),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
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
              controller: _passwordController,
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
            loading? Center(child: CircularProgressIndicator()) : ElevatedButton(child: Text("Submit"), onPressed: _signIn),
            SizedBox(height: 10),
            Container(
              child: GestureDetector(
                onTap: () {
                  // Lorsque le texte est tapé, naviguer vers la page de connexion
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                child: Text(
                  "You don't have an account ? SignUP",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      loading = true;
    });
    String email = _emailController.text;

    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      loading = false;
    });
    if (user != null) {
      print("User is successfully created");
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const Foods()),
        (route) => false,
      );
    } else {
      print("Something went wrong");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Identifiant ou mot de passe incorrecte"),
          // duration: Duration(seconds: 2),
          // action: SnackBarAction(
          //   label: 'Action',
          //   onPressed: () {
          //     // Code to execute.
          //   },
          // ),
        ),
      );
    }
  }
}
