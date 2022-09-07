import 'package:blog_travel/homescreen.dart';
import 'package:blog_travel/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController _mail = TextEditingController();
  TextEditingController _pass = TextEditingController();
  signup() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _mail.text,
        password: _pass.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
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
                "Welcome to travel blog.\n To join us please provide your\n valid information",
                style: GoogleFonts.kalam(
                    color: Colors.white, fontSize: 24, letterSpacing: 1),
              )),
          Positioned(
              top: 400,
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
                    style: TextStyle(color: Colors.amber),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "Enter your Name"),
                  ),
                )),
              )),
          Positioned(
              top: 520,
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
              top: 640,
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
              top: 850,
              left: 100,
              child: InkWell(
                onTap: () {
                  signup();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homescreen()));
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
                      "REGISTRATION",
                      style: GoogleFonts.kalam(
                          color: Colors.white, fontSize: 20, letterSpacing: 3),
                    ),
                  ),
                ),
              )),
          Positioned(
            top: 950,
            left: 70,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Signin()));
              },
              child: Text(
                "Already Have Account ? Sign IN",
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
