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
            List.generate(81, (i) => TicTacWidget()),
      ),
    );
  }
}


class TicTacWidget extends StatefulWidget {
  @override
  _TicTacWidgetState createState() => _TicTacWidgetState();
}

class _TicTacWidgetState extends State<TicTacWidget> {
  bool _isNull = true;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.close),
      color: Colors.red[10],
      onPressed: _toggleIsNull,
    );
  }

  void _toggleIsNull(){
    setState(() {
      if(_isNull) _isNull = false;
      else _isNull = true;
    });

  }

}