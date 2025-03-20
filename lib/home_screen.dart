import 'package:flutter/material.dart';
import 'package:xo_game/home_page.dart';
import 'package:xo_game/home_screen_args.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const String routeName = 'home_screen';
  String player1Name = '';
  String player2Name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'Player 1 Name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              onChanged: (value) => player1Name = value,
            ),
            const SizedBox(height: 25),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Player 1 Name',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              onChanged: (value) => player2Name = value,
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  HomePage.routeName,
                  arguments: HomeScreenArgs(
                      player1Name: player1Name, player2Name: player2Name),
                );
              },
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Colors.blueAccent,
                ),
              ),
              child: const Text(
                "Let's play",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
