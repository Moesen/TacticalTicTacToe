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
      body: GridView.count(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 9,
          children:
            List.generate(81, (i) => TicTac()),
      ),
    );
  }
}


