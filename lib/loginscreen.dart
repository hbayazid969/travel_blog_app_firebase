import 'package:blog_travel/homescreen.dart';
import 'package:blog_travel/signupscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController _mail = TextEditingController();
  TextEditingController _pass = TextEditingController();
  signin() async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _mail.text, password: _pass.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Homescreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: Opacity(
              opacity: 0.99,
              child: Image.asset(
                "images/splas.jpg",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              top: 204,
              left: 50,
              child: Text(
                "Welcome Back.\n Please login for more access\n in our app",
                style: GoogleFonts.kalam(
                    color: Colors.white, fontSize: 24, letterSpacing: 1),
              )),
          Positioned(
              top: 420,
              left: 50,
              child: Container(
                height: 100,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(38),
                ),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    controller: _mail,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        hintText: "Enter your mail"),
                  ),
                )),
              )),
          Positioned(
              top: 540,
              left: 50,
              child: Container(
                height: 100,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(38),
                ),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(
                    controller: _pass,
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        hintText: "Enter your Password"),
                  ),
                )),
              )),
          Positioned(
              top: 750,
              left: 100,
              child: InkWell(
                onTap: () {
                  signin();
                },
                child: Container(
                  height: 70,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(38),
                  ),
                  child: Center(
                    child: Text(
                      "SIGN IN",
                      style: GoogleFonts.kalam(
                          color: Colors.white, fontSize: 20, letterSpacing: 3),
                    ),
                  ),
                ),
              )),
          Positioned(
            top: 850,
            left: 70,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Signup()));
              },
              child: Text(
                "Don't Have Account ? Sign UP",
                style: GoogleFonts.kalam(
                    color: Colors.white, fontSize: 18, letterSpacing: 3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
