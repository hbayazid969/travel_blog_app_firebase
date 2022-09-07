import 'package:blog_travel/displayscreen.dart';
import 'package:blog_travel/homescreen.dart';
import 'package:blog_travel/loginscreen.dart';
import 'package:blog_travel/signupscreen.dart';
import 'package:blog_travel/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'blog_travel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
