import 'package:flutter/material.dart';
import 'Board.dart';

void main() {
  runApp(MaterialApp(
    title: 'Tactical Tic Tac Toe',
    home: Home(),
  ));
}

class Game extends StatelessWidget {
  var board = Board();
  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: defaultBar("Play!"),
      body: board.getBoard(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultBar("Tactical Tic Tac Toe"),
      body:
      ),
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
