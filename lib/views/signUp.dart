import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/user_auth/firebase_auth_implementation/firabase_auth_services.dart';
import 'package:flutter_application_1/views/login.dart';

import 'foods.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmController = TextEditingController();
  bool pswObscure = true;
  bool confpswObscure = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
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
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: "Username",
                labelText: "Votre Username",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: "Email",
                labelText: "Votre Email",
                prefixIcon: Icon(Icons.mail),
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
            TextField(
              controller: _confirmController,
              obscureText: confpswObscure,
              decoration: InputDecoration(
                hintText: "Confirmez votre mot de passe ",
                labelText: "Confirmation",
                prefixIcon: Icon(Icons.lock),
                suffix: InkWell(
                  child: Icon(
                    confpswObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                  onTap: () {
                    setState(() {
                      confpswObscure = !confpswObscure;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(child: Text("Sign Up"), onPressed: _signUp),
            SizedBox(height: 10),
            Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Text(
                  "You already have an account ? SignIn",
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

  void _signUp() async {
    String username = _usernameController.text;

    String email = _emailController.text;

    String password = _passwordController.text;

    String confirm = _confirmController.text;

    if (password == confirm) {
      User? user = await _auth.signUpWithEmailAndPassword(email, password);

      if (user != null) {
        print("User is successfully created");
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Login()),
          (route) => false,
        );
      } else {
        print("Something went wrong");
      }
    }
  }
}
