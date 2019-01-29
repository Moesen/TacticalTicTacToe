import 'package:flutter/material.dart';

class Board{
  var boards = List<Widget>();
  int allowed_board_idx; //the board that the player is allowed to choose. Null for all boards

  Board();

}

class Logic{
  int nextBoard;

}

class SubBoard{
  var fields;
  TicTac state;
  int pos;

  SubBoard(int pos){
    this.pos = pos;
    initSubBoard();
  }
  void initSubBoard(){
    for(int i = 0; i < 9; i++){
      fields.add(TicTac());
    }
  }

}

class TicTac extends StatefulWidget {
  int pos;
  int superPos;
  TicTac(int superPos, int pos){
    this.pos = pos;
    this.superPos = superPos;
  }

  @override
  _TicTacWidgetState createState() => _TicTacWidgetState();
}

class _TicTacWidgetState extends State<TicTac> {
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
      if (_isNull)
        _isNull = false;
      else
        _isNull = true;
    });
  }

}

