import 'package:flutter/material.dart';
import 'Board.dart';

class Turn extends StatefulWidget {

  Turn();

  @override
  State<StatefulWidget> createState() {
    return new _TurnState();
  }
}

class _TurnState extends State<Turn> {

  var logic = Logic(); //access to static logic variables


  _TurnState();

  @override
  Widget build(BuildContext context) {
    return Text(
      "The current turn is " + logic.getTurn(),
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle()
    );
  }



}

class BoardMsg extends StatefulWidget {

  BoardMsg();

  @override
  State<StatefulWidget> createState() {
    return new _BoardMsgState();
  }
}

class _BoardMsgState extends State<BoardMsg> {

  var logic = Logic(); //access to static logic variables


  _BoardMsgState();

  @override
  Widget build(BuildContext context) {
    return Text(
        "The current board is ",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle()
    );
  }

}