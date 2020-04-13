import 'package:flutter/material.dart';
import 'dart:math';

class Dice extends StatefulWidget {

  int diceValue = 0;

  Dice(@required this.diceValue);

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {

  String diceImage;

  List<String> diceAssets = [
    "assets/images/dice1.png",
    "assets/images/dice2.png",
    "assets/images/dice3.png",
    "assets/images/dice4.png",
    "assets/images/dice5.png",
    "assets/images/dice6.png"
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Image.asset(_getImageByValue(widget.diceValue), fit: BoxFit.fill),
    );
  }


  String _getImageByValue(int value) {
    return diceAssets[value - 1];
  }
  
}
