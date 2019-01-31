import 'package:flutter/material.dart';

import 'boardWidgets.dart';
import 'logic.dart';
import 'playWidgets.dart';

void main() {
  runApp(MaterialApp(
    routes: <String, WidgetBuilder>{
      '/game': (BuildContext context) => new Game(),
      '/how2': (BuildContext context) => new HowTo()
    },
    title: 'Tactical Tic Tac Toe',
    home: Home(),
    theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.deepOrange[900],
        accentColor: Colors.cyan[100],
        fontFamily: 'Krub',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
          title: TextStyle(
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
          body1: TextStyle(fontSize: 72, fontFamily: 'Arial'),
        )),
  ));
}

class Game extends StatelessWidget {
  var layout = StandardLayout(infoText: "Home");
  static var turnText = Turn();
  var board = Board(turnText);
  var logic = Logic();

  Game() {
    logic.setBoard(board);
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
        appBar: AppBar(
          title: Text("Tactify"),
          centerTitle: true,
          leading: GestureDetector(child: Hero(
            tag: "play",
            child: Icon(
              Icons.arrow_back_ios,
              size: 30,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          }
        )

        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[board, turnText]));
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(),
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: (() =>
                      Navigator.of(context).pushNamed('/game'
                      )),
                    child: Hero(
                        tag: "play",
                        child: Icon(
                          Icons.play_circle_filled,
                          size: 150,
                        )),
                  ),
                  Text(
                    "Play",
                    style: Theme.of(context).textTheme.title,
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: (() =>
                      Navigator.of(context).pushNamed('/how2'
                      )),
                    child: Hero(
                      tag: "how2",
                      child: Icon(
                        Icons.help,
                        size: 110,
                      ),
                    ),
                  ),
                  Text(
                    "How To",
                    style: Theme.of(context).textTheme.title,
                  )
                ],
              ),
              Row(),
            ],
          ),
        ));
  }
}

class HowTo extends StatelessWidget {
  var layout = StandardLayout(infoText: "How To");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
        appBar: AppBar(
          title: Text("How To"),
            centerTitle: true,
            leading: GestureDetector(child: Hero(
              tag: "how",
              child: Icon(
                Icons.arrow_back_ios,
                size: 30,
              ),
            ),
                onTap: () {
                  Navigator.pop(context);
                }
            )
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: "how2",
                child: Icon(
                  Icons.help,
                  size: 110,
                ),
              ),
            ],
          ),
        ));
  }
}

class StandardLayout {

  final String infoText;

  StandardLayout({this.infoText});


  AppBar getAppBar() {
    return AppBar(
      title: Text(infoText),
      centerTitle: true,
    );
  }
}
class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return new FadeTransition(opacity: animation, child: child);
  }
}
