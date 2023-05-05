import 'package:flutter/material.dart';
import 'package:untitled976/home_screen.dart';
import 'package:untitled976/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',

      home:  SplashScreen(),
    );
  }
}

