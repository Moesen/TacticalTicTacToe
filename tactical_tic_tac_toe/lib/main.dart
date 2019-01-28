import 'package:flutter/material.dart';
import 'Board.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Tutorial',
    home: TutorialHome(),
  ));
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for the major Material Components.
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: Text('Tactical Tic Tac Toe'),
        actions: <Widget>[
          MyButton(

          ),
        ],
      ),

      // body is the majority of the screen.
      body: ListView(
        children: <Widget>[
          Text("Hey"),
          Center(
              child: Text("Play TACTICAL TIC TAC TOE",
            style: Theme.of(context).textTheme.headline
          )
          )
        ]
      ),
    );
  }

}



class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.red[300],
        ),
        child: Center(
          child: Text('Restart'),
        ),
      ),
    );
  }
}
