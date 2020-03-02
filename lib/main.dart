import 'package:flutter/material.dart';
import 'package:tictactoe/screens/game_screen.dart';
import 'package:tictactoe/screens/selection_screen.dart';
import 'package:tictactoe/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        GameScreen.id: (context) => GameScreen(),
        SelectionScreen.id: (context) => SelectionScreen(),
      },
    );
  }
}
