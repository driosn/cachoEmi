import 'package:flutter/material.dart';

import 'package:cachoemi/src/pages/home/home_screen.dart';
import 'package:cachoemi/src/router/router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cacho EMI',
      theme: ThemeData(
        primaryColor: Colors.blue,
        textTheme: TextTheme(
          body1: TextStyle(fontFamily: 'Cabin', fontSize: 16.0),
          body2: TextStyle(fontFamily: 'Cabin', fontSize: 20.0),
          title: TextStyle(fontFamily: 'Cabin', fontSize: 24.0),
        )
      ),
      home: HomeScreen(),
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute
    );
  }
}