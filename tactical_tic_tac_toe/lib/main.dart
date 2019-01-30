import 'package:flutter/material.dart';
import 'Board.dart';
import 'playWidgets.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    title: 'Tactical Tic Tac Toe',
    home: Game(),
  ));
}

class Game extends StatelessWidget {
  final stream = StreamController();

  var board = Board();
  var turnText = Turn();
  var boardMsg = BoardMsg();
  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: defaultBar("Play!"),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[board, turnText, boardMsg]
      )
    );
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
  defaultBar(String title):
      super(
        elevation: 0.5,
        title: new Text(title,
          style: TextStyle(fontFamily: 'Krub',
              fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8)),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      );
}
