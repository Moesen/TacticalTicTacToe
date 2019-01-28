import 'package:flutter/material.dart';

class Board{
  var boards = List<Widget>();

  Board()
  {
    initBoard();
  }


  void initBoard(){
    for(int i = 0; i < 9; i++){
      var sub = SubBoard();
      boards.add(sub.arrangeInGrid());
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

/**
 * Use this to change the type.
 * If not changed change and return true,
 * else retunr false
 */
class TicTac {
  //Field
  String type;

  //Constructor
  TicTac(){}

  //Methods
  bool changeType(int type){
    if(type != null) {
      switch (type) {
        case 0:
          this.type = "cross";
          break;
        case 1:
          this.type = "circle";
          break;
      }
      return true;
    } else {
      return false;
    }
  }



}
