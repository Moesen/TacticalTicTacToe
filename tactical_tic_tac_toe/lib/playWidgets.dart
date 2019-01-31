import 'package:flutter/material.dart';

import 'logic.dart';

class Turn extends StatefulWidget {
  State state;

  Turn();

  @override
  State<StatefulWidget> createState() {
    state = new _TurnState();
    return state;
  }
}

class _TurnState extends State<Turn> {
  static var logic = Logic(); //access to static logic variables
  String txt = "Turn: ";

  var myIcon = Icon(Icons.close, color: Colors.green, size: 30);
  var winnerDeclaration = Text("");

  _TurnState();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(txt,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 30)),
              myIcon
            ],
          ),
          winnerDeclaration
        ]));
  }

  void setTxt() {
    setState(() {
      myIcon = logic.getTurn() == "cross"
          ? Icon(Icons.close, color: Colors.green, size: 30)
          : Icon(Icons.radio_button_unchecked,
              color: Colors.lightBlue, size: 50);
    });
  }

  void declareWinner(String winner) {
    setState(() {
      winnerDeclaration = Text(winner.toUpperCase() + " HAS WON THE GAME USING " ,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 50));
    });
  }
}
