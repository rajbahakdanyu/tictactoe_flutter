import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tictactoe/screens/selection_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static final id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Tic Tac Toe',
                style: TextStyle(
                  fontFamily: 'Playball',
                  fontSize: 40.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, SelectionScreen.id);
                },
                child: Text('Start'),
                color: Colors.lightBlueAccent,
                textColor: Colors.white,
              ),
              RaisedButton(
                onPressed: () {
                  exit(0);
                },
                child: Text('Exit'),
                color: Colors.redAccent,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
