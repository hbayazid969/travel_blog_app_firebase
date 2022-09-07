import 'package:blog_travel/loginscreen.dart';
import 'package:blog_travel/signupscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(
            child: Opacity(
              opacity: 0.96,
              child: Image.asset(
                "images/splas.jpg",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              top: 104,
              left: 50,
              child: Text(
                "Everyday New",
                style: GoogleFonts.kalam(
                    color: Colors.white, fontSize: 24, letterSpacing: 1),
              )),
          Positioned(
              top: 150,
              left: 50,
              child: Text(
                "Travel Blog",
                style: GoogleFonts.archivoBlack(
                    color: Colors.white, fontSize: 25, letterSpacing: 3),
              )),
          Positioned(
              top: 800,
              left: 100,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signin()));
                },
                child: Container(
                  height: 70,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(38),
                  ),
                  child: Center(
                    child: Text(
                      "SIGN IN",
                      style: GoogleFonts.kalam(
                          color: Colors.black, fontSize: 20, letterSpacing: 3),
                    ),
                  ),
                ),
              )),
          Positioned(
              top: 900,
              left: 100,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Signup()));
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
        ],
      ),
    );
  }
}
