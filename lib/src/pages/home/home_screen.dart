import 'package:cachoemi/src/widgets/RoundedButton.dart';
import 'package:flutter/material.dart';
    
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 300.0,
                child: Image.asset('assets/images/logo_cacho_emi.png'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RoundedButton(
                      buttonText: "JUGAR",
                      onPressed: () => _showPlayersDialog(context)
                  ),
                  SizedBox(width: 25.0,),
                  RoundedButton(
                      buttonText: "REGLAS",
                      onPressed: () {}
                  ),
                ],
              )
            ],
          ),
        )
    );
  }

  void _showPlayersDialog(BuildContext context) {


    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            width: 100,
            child: Dialog(
              child: Container(
                height: ,
                child: Text("ASDJLASK"),
              ),
            ),
          );
        }
    );
  }
}
    