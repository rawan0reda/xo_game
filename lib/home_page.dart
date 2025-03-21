import 'package:flutter/material.dart';
import 'package:xo_game/custom_elevated_button.dart';
import 'package:xo_game/home_screen_args.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}
//homepage
class _HomePageState extends State<HomePage> {
  List<String> boardState = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {
    HomeScreenArgs args =
        ModalRoute.of(context)!.settings.arguments as HomeScreenArgs;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'XO Game',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${args.player1Name} (X)',
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      player1Score.toString(),
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                     //added new features
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${args.player2Name} (O)',
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      player2Score.toString(),
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomElevatedButton(
                  text: boardState[0],
                  onButtonClicked: onButtonAction,
                  index: 0,
                ),
                CustomElevatedButton(
                  text: boardState[1],
                  onButtonClicked: onButtonAction,
                  index: 1,
                ),
                CustomElevatedButton(
                  text: boardState[2],
                  onButtonClicked: onButtonAction,
                  index: 2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomElevatedButton(
                  text: boardState[3],
                  onButtonClicked: onButtonAction,
                  index: 3,
                ),
                CustomElevatedButton(
                  text: boardState[4],
                  onButtonClicked: onButtonAction,
                  index: 4,
                ),
                CustomElevatedButton(
                  text: boardState[5],
                  onButtonClicked: onButtonAction,
                  index: 5,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomElevatedButton(
                  text: boardState[6],
                  index: 6,
                  onButtonClicked: onButtonAction,
                ),
                CustomElevatedButton(
                  text: boardState[7],
                  onButtonClicked: onButtonAction,
                  index: 7,
                ),
                CustomElevatedButton(
                  text: boardState[8],
                  onButtonClicked: onButtonAction,
                  index: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;

  void onButtonAction(int index) {
    if (boardState[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      boardState[index] = 'X';
    } else {
      boardState[index] = 'O';
    }
    counter++;
    if (checkWinner('X')) {
      player1Score += 5;
      initBoard();
    } else if (checkWinner('O')) {
      player2Score += 5;
      initBoard();
    } else if (counter == 9) {
      initBoard();
    }
    setState(() {});
  }

  bool checkWinner(String symbol) {
    // 0 1 2
    // 3 4 5
    // 6 7 8
    //rows i=0,3,6
    for (int i = 0; i <= 6; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }
    // 0 1 2
    // 3 4 5
    // 6 7 8
    //columns i=0,1,2

    for (int i = 0; i <= 2; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }
    // 0 1 2
    // 3 4 5
    // 6 7 8
    //diagonal
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }
    return false;
  }

  void initBoard() {
    boardState = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
    counter = 0;
  }
}
