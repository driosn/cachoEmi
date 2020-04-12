import 'package:cachoemi/src/pages/home/home_screen.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
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