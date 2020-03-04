import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tictactoe/buttons/game_button.dart';
import 'package:tictactoe/custom_dialog.dart';

class GameScreen extends StatefulWidget {
  final String matchType;

  GameScreen({@required this.matchType});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<GameButton> buttonList;

  var player1;
  var player2;
  var activePlayer;

  @override
  void initState() {
    super.initState();
    buttonList = getButtonList();
  }

  List<GameButton> getButtonList() {
    player1 = List();
    player2 = List();
    activePlayer = 1;

    var gameButtons = <GameButton>[
      new GameButton(id: 1),
      new GameButton(id: 2),
      new GameButton(id: 3),
      new GameButton(id: 4),
      new GameButton(id: 5),
      new GameButton(id: 6),
      new GameButton(id: 7),
      new GameButton(id: 8),
      new GameButton(id: 9),
    ];

    return gameButtons;
  }

  void playGame(GameButton gb) {
    setState(() {
      if (activePlayer == 1) {
        gb.iconPlaced = 'X';
        activePlayer = 2;
        gb.buttonColor = Colors.lightBlueAccent;
        player1.add(gb.id);
      } else if (activePlayer == 2) {
        gb.iconPlaced = 'O';
        activePlayer = 1;
        gb.buttonColor = Colors.greenAccent;
        player2.add(gb.id);
      }
      gb.status = false;
      int winner = checkWinner();

      if (winner == 0) {
        if (buttonList.every((p) => p.iconPlaced != '')) {
          showDialog(
            context: context,
            builder: (_) => CustomDialog(
              title: 'It is a draw.',
              content: 'Press button to play again',
              callback: resetGame,
            ),
          );
        }
      }

      if (widget.matchType == 'computer') {
        activePlayer == 2 ? autoplay() : null;
      }
    });
  }

  void autoplay() {
    var emptyCells = List();
    var list = List.generate(9, (i) => i + 1);

    for (var cellId in list) {
      if (!(player1.contains(cellId) || player2.contains(cellId))) {
        emptyCells.add(cellId);
      }
    }

    var r = Random();
    var ranIndex = r.nextInt(emptyCells.length - 1);
    var cellId = emptyCells[ranIndex];
    int i = buttonList.indexWhere((p) => p.id == cellId);
    playGame(buttonList[i]);
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonList = getButtonList();
    });
  }

  int checkWinner() {
    int winner = 0;

    // Player 1 win conditions
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player1.contains(2) && player1.contains(4) && player1.contains(8)) {
      winner = 1;
    }
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }

    // Player 2 win conditions
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }
    if (player2.contains(2) && player2.contains(4) && player2.contains(8)) {
      winner = 2;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }

    if (winner != 0) {
      if (winner == 1) {
        showDialog(
          context: context,
          builder: (_) => CustomDialog(
            title: 'Player 1 won!!',
            content: 'Press button to play again',
            callback: resetGame,
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (_) => CustomDialog(
            title: 'Player 2 won!!',
            content: 'Press button to play again',
            callback: resetGame,
          ),
        );
      }
    }

    return winner;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: buttonList.length,
                itemBuilder: (context, i) => SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: RaisedButton(
                    onPressed: buttonList[i].status
                        ? () => playGame(buttonList[i])
                        : null,
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      buttonList[i].iconPlaced,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                      ),
                    ),
                    disabledColor: buttonList[i].buttonColor,
                  ),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/');
              },
              child: Text(
                'Exit game',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                ),
              ),
              color: Colors.red,
              padding: EdgeInsets.all(20.0),
            ),
          ],
        ),
      ),
    );
  }
}
