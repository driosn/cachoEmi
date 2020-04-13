import 'package:cachoemi/src/globals/globals.dart';
import 'package:cachoemi/src/providers/scores_provider_p_com.dart';
import 'package:cachoemi/src/providers/scores_provider_p_one.dart';
import 'package:cachoemi/src/providers/scores_provider_p_two.dart';
import 'package:cachoemi/src/ui/colors.dart';
import 'package:cachoemi/src/widgets/RoundedButton.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {

  int winnerPlayer;
  int winnerPlayerCode;

  @override
  Widget build(BuildContext context) {

    int firstPlayerScore = getTotalScore(firstPlayer);
    int secondPlayerScore = getTotalScore(secondPlayer);

    winnerPlayer = firstPlayerScore > secondPlayerScore
                  ? firstPlayerScore
                  : secondPlayerScore;

    winnerPlayerCode = firstPlayerScore > secondPlayerScore
                      ? firstPlayer
                      : secondPlayer;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Gano el jugador $winnerPlayerCode!", style: Theme.of(context).textTheme.title,),
            SizedBox(height: 42,),
            playerScoreContainer(firstPlayer, context),
            SizedBox(height: 28,),
            playerScoreContainer(secondPlayer, context),
            Expanded(child: SizedBox()),
            RoundedButton(
              buttonText: "ACEPTAR",
              onPressed: () => Navigator.pushNamed(context, '/'),
            )
          ],
        ),
      ),
    );
  }

  Widget playerScoreContainer(int playerCode, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor, width: 5, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(14.0),
        color: Colors.transparent
      ),
      child: Row(
        children: <Widget>[
          Text(
            playerCode == 3
                ? "Jugador COM"
                : "Jugador $playerCode",
            style: Theme.of(context).textTheme.body2,
          ),
          playerCode == winnerPlayerCode ?
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12.0),
            child: Icon(Icons.tag_faces, size: 32.0,),
          ) : Container(),
          Expanded(child: SizedBox()),
          Text(
            getTotalScore(playerCode).toString(),
            style: Theme.of(context).textTheme.body2,
          )
        ],
      ),
    );
  }

  getTotalScore(int playerCode) {
    switch(playerCode) {
      case 1: return scoresPlayerOne.totalScore;
      case 2: return scoresPlayerTwo.totalScore;
      case 3: return scoresPlayerCom.totalScore;
      default: break;
    }
  }
}
