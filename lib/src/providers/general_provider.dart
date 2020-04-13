import 'package:rxdart/rxdart.dart';

class GeneralProvider {

  static final GeneralProvider _singleton = new GeneralProvider._internal();

  factory GeneralProvider() => _singleton;

  GeneralProvider._internal();

  BehaviorSubject<int> _playerTurnController = new BehaviorSubject<int>();

  // Stream
  Stream<int> get playerTurnStream => _playerTurnController.stream;

  // Inputs
  Function(int) get changePlayerTurn => _playerTurnController.sink.add;

  // Values
  int get playerTurn => _playerTurnController.value;

  dispose() {
    _playerTurnController?.close();
  }
}

GeneralProvider generalSettings = new GeneralProvider();