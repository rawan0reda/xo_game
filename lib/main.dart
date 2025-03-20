import 'package:flutter/material.dart';
import 'package:xo_game/home_page.dart';
import 'package:xo_game/home_screen.dart';

void main() {
  runApp(const MyApp());
}

// ignore: camel_case_types
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        HomePage.routeName: (context) => HomePage(),
      },
    );
  }
}
