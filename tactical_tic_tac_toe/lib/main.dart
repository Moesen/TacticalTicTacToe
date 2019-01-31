import 'package:flutter/material.dart';

import 'boardWidgets.dart';
import 'logic.dart';
import 'playWidgets.dart';

void main() {
  runApp(MaterialApp(
    routes: <String, WidgetBuilder>{
      '/home': (BuildContext context) => new Home(),
      '/game': (BuildContext context) => new Game(),
      '/how2': (BuildContext context) => new HowTo(),
      '/win': (BuildContext context) => new winScreen(),
    },
    title: 'Tactical Tic Tac Toe',
    home: Home(),
    theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[900],
        accentColor: Colors.cyan[100],
        fontFamily: 'Krub',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
          title: TextStyle(
              fontSize: 50,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
          body1: TextStyle(fontSize: 72, fontFamily: 'Arial'),
          display1: TextStyle(fontSize: 30, fontFamily: 'Krub', fontWeight: FontWeight.bold),
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
          title: Text("Tactify", style: Theme.of(context).textTheme.display1,),
          centerTitle: true,
          leading: GestureDetector(
              child: Hero(
                tag: "play",
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              }),
          actions: <Widget>[
            GestureDetector(
                //ToDo Make game reset
                onTap: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.undo),
                    Text("Restart"),
                  ],
                )),
            Row(
              children: <Widget>[Text("   ")],
            ),
          ],
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
                    onTap: (() => Navigator.of(context).pushNamed('/game')),
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
                    onTap: (() => Navigator.of(context).pushNamed('/how2')),
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
        appBar: AppBar(
            title: Text("How To", style: Theme.of(context).textTheme.display1,),
            centerTitle: true,
            leading: GestureDetector(
                child: Hero(
                  tag: "how",
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                })),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Hero(
                  tag: "how2",
                  child: Icon(
                    Icons.help,
                    size: 110,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class winScreen extends StatelessWidget {
  var layout = StandardLayout();
  var logic = Logic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Winner", style: Theme.of(context).textTheme.display1,),
            centerTitle: true,
            leading: Icon(null),
          ),
        body: Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon((logic.getTurn() == 'cross')
                    ? Icons.close
                    : Icons.radio_button_unchecked, size: 100,),
                Text("WINS!"),
                GestureDetector(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.arrow_back_ios, size: 50,),
                      Text("Go Back"),
                    ],
                  ),
                onTap: () => Navigator.of(context)
                    .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false),
                )
              ],
            ),
          ),
        ));
  }
}

class StandardLayout {
  final String infoText;

  StandardLayout({this.infoText});

  AppBar getAppBar() {
    return AppBar(
      title: Text(infoText, style: TextStyle(fontSize: 30, fontFamily: 'Krub', fontWeight: FontWeight.bold),),
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
