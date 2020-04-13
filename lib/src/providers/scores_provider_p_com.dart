import 'package:rxdart/rxdart.dart';

class ScoresProviderPlayerCom {

  static final ScoresProviderPlayerCom _singleton = ScoresProviderPlayerCom._internal();

  ScoresProviderPlayerCom._internal() {
    resetScorePlayerCom();
    resetTotalScore();
  }

  factory ScoresProviderPlayerCom() => _singleton;

  BehaviorSubject<Map<String, int>> _scoreTableController = new BehaviorSubject<Map<String, int>>();
  BehaviorSubject<int> _totalScoreController = new BehaviorSubject<int>();

  // Stream
  Stream<Map<String, int>> get scoreTableStream => _scoreTableController.stream;
  Stream<int> get totalScoreStream => _totalScoreController.stream;

  // Inputs
  Function(Map<String, int>) get changeScoreTable => _scoreTableController.sink.add;
  Function(int) get changeTotalScore => _totalScoreController.sink.add;

  // Values
  Map<String, int> get scoreTable => _scoreTableController.value;
  int get totalScore => _totalScoreController.value;

  dispose() {
    _scoreTableController?.close();
    _totalScoreController?.close();
  }

  resetScorePlayerCom() {
    changeScoreTable({
      "Uno": -1,
      "Dos": -1,
      "Tres": -1,
      "Cuatro": -1,
      "Cinco": -1,
      "Seis": -1,
      "Doble": -1,
      "Escalera": -1,
      "Full": -1,
      "Poker": -1,
      "Grande": -1,
      "Grande2": -1,
    });
  }

  resetTotalScore() {
    changeTotalScore(0);
  }
}

ScoresProviderPlayerCom scoresPlayerCom = new ScoresProviderPlayerCom();
