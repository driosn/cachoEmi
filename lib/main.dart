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
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute
    );
  }
}