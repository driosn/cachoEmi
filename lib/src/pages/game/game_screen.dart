import 'dart:math';
import 'package:cachoemi/src/globals/globals.dart';
import 'package:cachoemi/src/pages/game/widgets/dice.dart';
import 'package:cachoemi/src/pages/game/widgets/point_category.dart';
import 'package:cachoemi/src/pages/tutorial/results_screen.dart';
import 'package:cachoemi/src/providers/general_provider.dart';
import 'package:cachoemi/src/providers/scores_provider_p_com.dart';
import 'package:cachoemi/src/providers/scores_provider_p_one.dart';
import 'package:cachoemi/src/providers/scores_provider_p_two.dart';
import 'package:cachoemi/src/ui/colors.dart';
import 'package:cachoemi/src/utils/point_calculator.dart';
import 'package:cachoemi/src/widgets/RoundedButton.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {

  int firstPlayerCode;
  int secondPlayerCode;

  GameScreen(@required this.firstPlayerCode, @required this.secondPlayerCode);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  Map<String, int> currentPlayerScore;
  int currentTotalPlayerScore = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Player 1 always start
    currentPlayer = widget.firstPlayerCode;
    firstPlayer = widget.firstPlayerCode;
    secondPlayer = widget.secondPlayerCode;
    generalSettings.changePlayerTurn(currentPlayer);
  }

  @override
  Widget build(BuildContext context) {

    countDices(1);
    currentPlayer = generalSettings.playerTurn;
    currentPlayerScore = getCurrentPlayerScore();

    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: generalSettings.playerTurnStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {

            verifyFinishedGame();

            if(snapshot.data != 4) {

              countDices(1);
              currentPlayer = generalSettings.playerTurn;
              currentPlayerScore = getCurrentPlayerScore();
              currentTotalPlayerScore = getCurrentTotalPlayerScore();

              print("CurrentPlayer: $currentPlayer");
              print("VALOR DEL UNO: ${getCurrentPlayerScore()['Uno']}");


              return Container(
                child: Center(
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: _pointsSection(),
                          flex: 8,
                        ),
                        Flexible(
                            child: _gameSection(),
                            flex: 12
                        )
                      ],
                    )
                ),
              );
            } else {
              return ResultsScreen();
            }
          },
        )
      ),
    );
  }

  Widget _pointsSection() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      color: primaryColor,
      child: Column(
        children: <Widget>[
          Text(
              "Turno: Jugador $currentPlayer",
              style: Theme.of(context).textTheme.title.merge(TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
          ),
          SizedBox(height: 12.0),
          Flexible(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      PointCategory(
                        categoryName: "Uno",
                        possibleScore: PointCalculator.calculateUnos(dicesPoints),
                        currentPointsValue: currentPlayerScore["Uno"],
                      ),
                      PointCategory(
                        categoryName: "Dos",
                        possibleScore: PointCalculator.calculateDos(dicesPoints),
                        currentPointsValue: currentPlayerScore["Dos"],
                      ),
                      PointCategory(
                        categoryName: "Tres",
                        possibleScore: PointCalculator.calculateTres(dicesPoints),
                        currentPointsValue: currentPlayerScore["Tres"],
                      ),
                      PointCategory(
                        categoryName: "Cuatro",
                        possibleScore: PointCalculator.calculateCuatros(dicesPoints),
                        currentPointsValue: currentPlayerScore["Cuatro"],
                      ),
                      PointCategory(
                        categoryName: "Cinco",
                        possibleScore: PointCalculator.calculateCincos(dicesPoints),
                        currentPointsValue: currentPlayerScore["Cinco"],
                      ),
                      PointCategory(
                        categoryName: "Seis",
                        possibleScore: PointCalculator.calculateSeis(dicesPoints),
                        currentPointsValue: currentPlayerScore["Seis"],
                      )
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  VerticalDivider(width: 2.0, color: primaryColor,),
                  Expanded(child: SizedBox()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      PointCategory(
                        categoryName: "Doble",
                        possibleScore: PointCalculator.calculateDoble(dicesPoints),
                        currentPointsValue: currentPlayerScore["Doble"],
                      ),
                      PointCategory(
                        categoryName: "Escalera",
                        possibleScore: PointCalculator.calculateEscalera(dicesPoints),
                        currentPointsValue: currentPlayerScore["Escalera"],
                      ),
                      PointCategory(
                        categoryName: "Full",
                        possibleScore: PointCalculator.calculateFull(dicesPoints),
                        currentPointsValue: currentPlayerScore["Full"],
                      ),
                      PointCategory(
                        categoryName: "Poker",
                        possibleScore: PointCalculator.calculatePoker(dicesPoints),
                        currentPointsValue: currentPlayerScore["Poker"],
                      ),
                      PointCategory(
                        categoryName: "Grande",
                        possibleScore: PointCalculator.calculateGrande(dicesPoints),
                        currentPointsValue: currentPlayerScore["Grande"],
                      ),
                      PointCategory(
                        categoryName: "Grande2",
                        possibleScore: PointCalculator.calculateGrande2(dicesPoints),
                        currentPointsValue: currentPlayerScore["Grande2"],
                      ),
                    ],
                  )
                ],
              )
            ),
          ),
          SizedBox(height: 12.0,),
          Text(
              "Puntaje: $currentTotalPlayerScore",
              style: Theme.of(context).textTheme.title.merge(TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
          ),
        ],
      ),
    );
  }

  Widget _gameSection() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      color: Colors.yellow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(child: _rollDices(), flex: 5,),
          Container(
            margin: EdgeInsets.all(8.0),
            child: RoundedButton.custom(
              buttonText: "LANZAR DADOS",
              buttonColor: rollQuantity != 3 ? primaryColor : Colors.white70,
              onPressed: rollQuantity != 3 ? rollDicesFunction : null,
            ),
          )       ,
          Flexible(child: _selectedDices(), flex: 2,)
        ],
      ),
    );
  }

  Widget _rollDices() {
    return Container(
      padding: EdgeInsets.all(24.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.black, style: BorderStyle.solid, width: 5)
      ),
      child: Center(
        child: rollQuantity > 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: getDiceRollWidgets()
                  ),
                ],
              )
            : Container()
      ),
    );
  }

  Widget _gameDice(Dice dice) {
    return Container(
      height: 70.0,
      width: 70.0,
      child: dice,
    );
  }

  Widget _selectedDices() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: getSavedDiceWidgets()
      ),
    );
  }

  Widget _diceSavedField([Widget mChild]) {
    return Container(
      height: 60.0,
      width: 60.0,
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.black, style: BorderStyle.solid, width: 5)
      ),
      child: mChild != null
            ? mChild
            : Container()
    );
  }

  void rollDicesFunction() {
    rollQuantity++;
    Random random = new Random();
    List<int> generatedNumbers = new List<int>();
    int quantityOfRollDices = 5 - playerSavedDices.length;

    for(int i = 0; i < quantityOfRollDices; i++) {
      generatedNumbers.add(random.nextInt(5) + 1);
    }

    playerRollDices = new List<int>();

    setState(() {
      playerRollDices.addAll(generatedNumbers);
    });
  }

  List<Widget> getDiceRollWidgets() {
    List<Widget> auxiliarList = new List();

    for(int i = 0; i < playerRollDices.length; i++) {
      auxiliarList.add(InkWell(
        child: _gameDice(Dice(playerRollDices[i])),
        onTap: () => saveDiceFunction(i, playerRollDices[i]),
      ));
    }
    return auxiliarList;
  }

  void saveDiceFunction(int diceIndex, int value) {
    setState(() {
      playerRollDices.removeAt(diceIndex);
      playerSavedDices.add(value);
    });
  }

  void removeSavedDiceFunction(int diceIndex, int value) {
    setState(() {
      playerSavedDices.removeAt(diceIndex);
      playerRollDices.add(value);
    });
  }

  List<Widget> getSavedDiceWidgets() {
    List<Widget> auxiliarList = new List<Widget>();

    int savedDicesLength = playerSavedDices.length;
    int voidSpaces = 5 - savedDicesLength;

    for(int i = 0; i < savedDicesLength; i++) {
      auxiliarList.add(
          InkWell(
            child: _diceSavedField(Dice(playerSavedDices[i])),
            onTap: () => removeSavedDiceFunction(i, playerSavedDices[i])
          )
      );
    }

    for(int i = 0; i < voidSpaces; i++) {
      auxiliarList.add(_diceSavedField());
    }
    return auxiliarList;
  }

  void countDices(int player) {
    List<int> allDices = new List<int>();

    allDices.addAll(playerRollDices);
    allDices.addAll(playerSavedDices);

    for(int i = 1; i <= 6; i ++) {
      int counter = 0;
      for(int j = 0; j < allDices.length; j++) {
        if(allDices[j] == i) counter++;
      }
      dicesPoints[i] = counter;
    }
  }

  Map<String, int> getCurrentPlayerScore() {
    switch (currentPlayer) {
      case 1: return scoresPlayerOne.scoreTable;
      case 2: return scoresPlayerTwo.scoreTable;
      case 3: return scoresPlayerCom.scoreTable;
      default: break;
    }
  }

  int getCurrentTotalPlayerScore() {
    switch(currentPlayer) {
      case 1: return scoresPlayerOne.totalScore;
      case 2: return scoresPlayerTwo.totalScore;
      case 3: return scoresPlayerCom.totalScore;
      default: break;
    }
  }

  Map<String, int> getTableScoreByCode(int playerCode) {
    switch (playerCode) {
      case 1: return scoresPlayerOne.scoreTable;
      case 2: return scoresPlayerTwo.scoreTable;
      case 3: return scoresPlayerCom.scoreTable;
      default: break;
    }
  }

  void verifyFinishedGame() {
    Map<String, int> firstPlayerTable = getTableScoreByCode(firstPlayer);
    Map<String, int> secondPlayerTable = getTableScoreByCode(secondPlayer);

    bool firstTableIsFilled = true;
    bool secondTableIsFilled = true;

    firstPlayerTable.forEach((key, value) {
      if(value == -1) firstTableIsFilled = false;
    });

    secondPlayerTable.forEach((key, value) {
      if(value == -1) secondTableIsFilled = false;
    });

    if(firstTableIsFilled && secondTableIsFilled) {
      generalSettings.changePlayerTurn(4);
    }
  }
}
