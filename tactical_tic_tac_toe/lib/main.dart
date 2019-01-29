import 'package:flutter/material.dart';
import 'Board.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Tutorial',
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  var board = Board();
  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.5,
        title: new Text("Tactical Tic-Tac-Toe",
          style: TextStyle(fontFamily: 'Krub',
              fontWeight: FontWeight.bold, color: Colors.black.withOpacity(0.8)),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: board.getBoard(),
    );
  }
}

ShapeBorder test(){

}
