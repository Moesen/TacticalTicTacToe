import 'package:flutter/material.dart';

import 'boardWidgets.dart';
import 'playWidgets.dart';
import 'logic.dart';

import 'presentation/custom_icons.dart';

void main() {
  runApp(MaterialApp(
    title: 'Tactical Tic Tac Toe',
    home: Home(),
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.deepOrange[900],
      accentColor: Colors.cyan[100],

      fontFamily: 'Krub',



      textTheme: TextTheme(
        headline: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
        title: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
        body1: TextStyle(fontSize: 14.0, fontFamily: 'Arial'),
      )
    ),
  ));
}

class Game extends StatelessWidget {
  var layout = StandardLayout(infoText: "Home");
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
        appBar: layout.getAppBar(),
        body: ListView(
            shrinkWrap: true,
            children: <Widget>[board,  turnText]));
  }
}

class Home extends StatelessWidget {
  var layout = StandardLayout(infoText: "Home");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: layout.getAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Game();
                    }));
                  },
                  child: Hero(tag: "play",
                      child: Icon(Icons.play_circle_filled,
                        size: 100,)),
                ),
                Text("Play",
                  style: Theme.of(context).textTheme.title,
                )
              ],
            ),
            Column(
              children: <Widget>[
                GestureDetector(
                  onTap: null,
                  child: Hero(tag: "how2",
                      child: Icon(Icons.help, size:
                        100,),
                  ),
                ),
                Text("How 2",
                  style: Theme.of(context).textTheme.title,
                )
              ],
            )
          ],
        ),
      )
    );
  }
}

class HowTo extends StatelessWidget {
  var layout = StandardLayout(infoText: "How To");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("How To", textAlign: TextAlign.center),
      ),
      body: GestureDetector(
        onTap: () {},
      ),
    );
  }
}

class StandardLayout {

  final String infoText;

  StandardLayout({this.infoText});


  AppBar getAppBar() {
    return AppBar(
      title: Text(infoText),

    );
  }

}