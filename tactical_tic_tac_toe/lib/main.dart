import 'package:flutter/material.dart';
import 'Board.dart';
import 'presentation/custom_icons.dart';

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
      appBar: ,
      body: board.getBoard(),
    );
  }
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ,
        body: Center(
        child: Column (
          children: <Widget> [
            Hero(
            tag: 'goToButton',
            child: IconButton(
              icon: Icon(CustomIcons.vkontakte),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Game()),
                );
              },
            ),
            ),
            Text("Go to Game"),
          ],
        ),
      ),
    );
  }

}

class TicTacBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    _TicTacBarState createState() => _TicTacBarState();
  }
}

class _TicTacBarState extends State<TicTacBar> {
  Choice _selectedChoice = choices[0];

  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];