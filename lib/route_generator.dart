import 'package:flutter/material.dart';
import 'package:tictactoe/screens/game_screen.dart';
import 'package:tictactoe/screens/selection_screen.dart';
import 'package:tictactoe/screens/welcome_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => WelcomeScreen());
      case '/select':
        return MaterialPageRoute(builder: (context) => SelectionScreen());
      case '/game':
        return MaterialPageRoute(
          builder: (context) => GameScreen(
            matchType: args,
          ),
        );
      default:
        return MaterialPageRoute(builder: (context) => WelcomeScreen());
    }
  }
}
