import 'dart:ui';

import 'package:cachoemi/src/globals/globals.dart';
import 'package:cachoemi/src/providers/general_provider.dart';
import 'package:cachoemi/src/providers/scores_provider_p_com.dart';
import 'package:cachoemi/src/providers/scores_provider_p_one.dart';
import 'package:cachoemi/src/providers/scores_provider_p_two.dart';
import 'package:cachoemi/src/widgets/RoundedButton.dart';
import 'package:flutter/material.dart';

class PointCategory extends StatefulWidget {

  String categoryName;
  int possibleScore = 0;
  int currentPointsValue;
  String pointsLabel;

  PointCategory({this.categoryName, this.possibleScore, this.currentPointsValue}) {
    if(currentPointsValue == -1) {
      pointsLabel = "___";
    } else {
      pointsLabel = currentPointsValue.toString();
    }
  }

  @override
  _PointCategoryState createState() => _PointCategoryState();
}

class _PointCategoryState extends State<PointCategory> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: <Widget>[
          Text(
            widget.categoryName,
            style: TextStyle(
                color: (widget.pointsLabel == "___" && widget.possibleScore > 0)
                      ? Colors.lightBlueAccent
                      : Colors.black
            ),
          ),
          SizedBox(width: 5.0,),
          Text(
            widget.pointsLabel,
            style: TextStyle(
              color: (widget.pointsLabel == "___" && widget.possibleScore > 0)
                  ? Colors.lightBlueAccent
                  : Colors.black
            )
          )
        ],
      ),
      onTap: () {
              if(widget.pointsLabel == "___") {
                setPoints();
              }
            }

    );
  }

  void setPoints() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Marcar puntaje"),
            content: Container(
              padding: EdgeInsets.all(12.0),
              child: Text("Estas seguro que quieres marcar ${widget.categoryName}\n con un puntaje de ${widget.possibleScore} puntos"),
            ),
            actions: <Widget>[
              RoundedButton(
                buttonText: "SI",
                onPressed: () { setState(() {
                  rollQuantity = 0;
                  playerRollDices = new List<int>();
                  playerSavedDices = new List<int>();
                  dicesPoints = new Map<int, int>();

                  if(widget.possibleScore > 0) {
                    setPointsToProvider();
                  } else {
                    setVoidPointsToProvider();
                  }

                  setTotalPointsToProvider();
                  if(generalSettings.playerTurn == firstPlayer) {
                    generalSettings.changePlayerTurn(secondPlayer);
                  } else {
                    generalSettings.changePlayerTurn(firstPlayer);
                  }
                  Navigator.pop(context);
                });},
              ),
              RoundedButton.custom(
                  buttonText: "NO",
                  buttonColor: Colors.grey,
                  onPressed: () { Navigator.pop(context); }
              )
            ],
          );
        }
    );
  }

  setTotalPointsToProvider() {
    int currentTotalPlayerScore;
    switch(currentPlayer) {
      case 1:
        currentTotalPlayerScore = scoresPlayerOne.totalScore;
        currentTotalPlayerScore += widget.possibleScore;
        scoresPlayerOne.changeTotalScore(currentTotalPlayerScore);
        break;
      case 2:
        currentTotalPlayerScore = scoresPlayerTwo.totalScore;
        currentTotalPlayerScore += widget.possibleScore;
        scoresPlayerTwo.changeTotalScore(currentTotalPlayerScore);
        break;
      case 3:
        currentTotalPlayerScore = scoresPlayerCom.totalScore;
        currentTotalPlayerScore += widget.possibleScore;
        scoresPlayerCom.changeTotalScore(currentTotalPlayerScore);
        break;
      default: break;
    }
  }

  setPointsToProvider() {
    Map<String, int> currentPlayerScore = new Map<String, int>();
    switch(currentPlayer) {
      case 1:
        currentPlayerScore = scoresPlayerOne.scoreTable;
        currentPlayerScore[widget.categoryName] = widget.possibleScore;
        scoresPlayerOne.changeScoreTable(currentPlayerScore);
        break;
      case 2:
        currentPlayerScore = scoresPlayerTwo.scoreTable;
        currentPlayerScore[widget.categoryName] = widget.possibleScore;
        scoresPlayerTwo.changeScoreTable(currentPlayerScore);
        break;
      case 3:
        currentPlayerScore = scoresPlayerCom.scoreTable;
        currentPlayerScore[widget.categoryName] = widget.possibleScore;
        scoresPlayerCom.changeScoreTable(currentPlayerScore);
        break;
      default: break;
    }
  }

  setVoidPointsToProvider() {
    Map<String, int> currentPlayerScore = new Map<String, int>();
    switch(currentPlayer) {
      case 1:
        currentPlayerScore = scoresPlayerOne.scoreTable;
        currentPlayerScore[widget.categoryName] = 0;
        scoresPlayerOne.changeScoreTable(currentPlayerScore);
        break;
      case 2:
        currentPlayerScore = scoresPlayerTwo.scoreTable;
        currentPlayerScore[widget.categoryName] = 0;
        scoresPlayerTwo.changeScoreTable(currentPlayerScore);
        break;
      case 3:
        currentPlayerScore = scoresPlayerCom.scoreTable;
        currentPlayerScore[widget.categoryName] = 0;
        scoresPlayerCom.changeScoreTable(currentPlayerScore);
        break;
      default: break;
    }
  }
}
