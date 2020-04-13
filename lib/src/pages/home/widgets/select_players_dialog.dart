import 'package:cachoemi/src/ui/colors.dart';
import 'package:cachoemi/src/widgets/RoundedButton.dart';
import 'package:flutter/material.dart';

class SelectPlayersDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
         _optionButton(
           buttonText: "1 Jugador vs COM",
           onPressed: () =>_goToSinglePlayerGame(context)
         ),
          SizedBox(width: 24.0),
          _optionButton(
            buttonText: "2 Jugadores",
            onPressed: () => _goToMultiplayerGame(context)
          )
        ]
      )
    );
  }

  Widget _optionButton({String buttonText, Function onPressed}) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(18.0),
        height: 150,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 5.0,
              offset: Offset(5.0, 5.0),
              blurRadius: 5.0
            )
          ]
        ),
        child: Center(child: Text(buttonText, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0),)),
      ),
      onTap: onPressed,
    );
  }

  void _goToSinglePlayerGame(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushNamed(context, 'single_game');
  }

  void _goToMultiplayerGame(BuildContext context) {
    Navigator.pop(context);
    Navigator.pushNamed(context, 'multiplayer_game');
  }

}
