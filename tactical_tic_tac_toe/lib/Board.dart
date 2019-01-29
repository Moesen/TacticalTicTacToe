import 'package:flutter/material.dart';

class Board{
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

class TicTac{




}
