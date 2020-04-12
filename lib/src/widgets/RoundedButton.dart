import 'package:cachoemi/src/ui/colors.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  String buttonText;
  Color buttonColor;
  Function onPressed;

  RoundedButton({@required this.buttonText, @required this.onPressed}) { buttonColor = primaryColor; }
  RoundedButton.custom({@required this.buttonText, @required this.buttonColor, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: this.buttonColor,
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.grey, blurRadius: 5.0, offset: Offset(5.0, 5.0), spreadRadius: 3.0)
          ]
        ),
        child: Text(this.buttonText, style: TextStyle(color: Colors.white),)
      ),
      onTap: this.onPressed,
    );
  }
}
