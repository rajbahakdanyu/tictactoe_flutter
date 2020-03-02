import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Choose Game Mode',
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
                  Navigator.pushNamed(context, '/game', arguments: 'player');
                },
                child: Text('VS P2'),
                color: Colors.lightBlueAccent,
                textColor: Colors.white,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/game', arguments: 'computer');
                },
                child: Text('VS COM'),
                color: Colors.greenAccent,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
