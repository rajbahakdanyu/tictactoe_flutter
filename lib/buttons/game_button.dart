import 'package:flutter/material.dart';

class GameButton {
  final id;
  String iconPlaced;
  Color buttonColor;
  bool status;

  GameButton(
      {@required this.id,
      this.iconPlaced = '',
      this.buttonColor = Colors.white,
      this.status = true});
}
