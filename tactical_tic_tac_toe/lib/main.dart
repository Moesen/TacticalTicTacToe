import 'package:flutter/material.dart';

import 'boardWidgets.dart';
import 'playWidgets.dart';
import 'logic.dart';

void main() {
  runApp(MaterialApp(
    title: 'Tactical Tic Tac Toe',
    home: Game(),
  ));
}

class Game extends StatelessWidget {
  static var turnText = Turn();
  var board = Board(turnText);

  var logic = Logic();

  Game(){
    logic.setBoard(board);
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
        appBar: defaultBar("Play!"),
        body: ListView(
            shrinkWrap: true,
            children: <Widget>[board,  turnText]));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultBar("Tactical Tic Tac Toe"),
      body: null,
    );
  }
}

class defaultBar extends AppBar {
  defaultBar(String title)
      : super(
          elevation: 0.5,
          title: new Text(
            title,
            style: TextStyle(
                fontFamily: 'Krub',
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.8)),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        );
}
