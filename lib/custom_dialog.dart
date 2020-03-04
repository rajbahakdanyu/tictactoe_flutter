import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback callback;
  final String actionText;

  CustomDialog(
      {this.title,
      this.content,
      this.actionText = 'Play again',
      this.callback});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(
          onPressed: callback,
          child: Text(actionText),
          color: Colors.white,
        ),
      ],
    );
  }
}
