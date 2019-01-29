import 'package:flutter/material.dart';

class Board{
  var boards = List<SubBoard>();

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
