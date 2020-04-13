import 'package:cachoemi/src/pages/game/game_screen.dart';
import 'package:cachoemi/src/pages/home/home_screen.dart';
import 'package:cachoemi/src/pages/tutorial/results_screen.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case 'single_game':
        return MaterialPageRoute(builder: (_) => GameScreen(1, 3));
      case 'multiplayer_game':
        return MaterialPageRoute(builder: (_) => GameScreen(1, 2));
      case 'results':
        return MaterialPageRoute(builder: (_) => ResultsScreen());
      default:
        return MaterialPageRoute(builder: (_) {
            return Scaffold(
              body: Center(
                child: Text("Hubo un error en la aplicación, reiniciala por favor"),
              ),
            );
          }
        );
    }
  }
}