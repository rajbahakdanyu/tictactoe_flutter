import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  final String matchType;

  GameScreen({@required this.matchType});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: <Widget>[
                Row(),
                Row(),
                Row(),
              ],
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.popAndPushNamed(context, '/');
              },
            ),
          ),
        ],
      ),
    );
  }
}
