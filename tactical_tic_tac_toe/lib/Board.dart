import 'package:flutter/material.dart';

class Board{
  String turn = "cross";
  var boards = List<Widget>();
  int allowed_board_idx; //the board that the player is allowed to choose. Null for all boards

  Board()
  {
    initBoard();
  }


  void initBoard(){
    for(int i = 0; i < 9; i++){
      var sub = SubBoard();
      boards.add(sub);
    }
  }


}

class SubBoard{
  var fields = List<TicTac>();
  TicTac state;

  SubBoard(){
    initSubBoard();
  }
  void initSubBoard(){
    for(int i = 0; i < 9; i++){
      fields.add(TicTac());
    }
  }

}


class TicTac extends StatefulWidget {
  @override
  _TicTacWidgetState createState() => _TicTacWidgetState();
}

class _TicTacWidgetState extends State<TicTac> {
  String type;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.close),
      color: Colors.red[10],
      onPressed: onPressingMethodCallActionDoingOfThings123,
    );
  }

  void _toggleIsNull(){
    setState(() {
      if(_isNull) _isNull = false;
      else _isNull = true;
    });
  }

  void onPressingMethodCallActionDoingOfThings123(){
    if (type == null && superPos == nextBoardPos){

    }
  }
}