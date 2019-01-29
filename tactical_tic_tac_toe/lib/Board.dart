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
      boards.add(sub.arrangeInGrid());
    }
  }

  GridView createGUI(){
    return GridView.count(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 3,
        children: boards
    );
  }

}

class SubBoard{
  var fields = List<TicTac>();

  SubBoard(){
    initSubBoard();
  }
  void initSubBoard(){
    for(int i = 0; i < 9; i++){
      fields.add(TicTac());
    }
  }

  GridView arrangeInGrid(){
  return GridView.count(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      children: fields
  );
  }
}

/**
 * Use this to change the type.
 * If not changed change and return true,
 * else retunr false
 */
class TicTac extends StatefulWidget{
  TicTac(){}
  String type;

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

    @override
    Widget build(BuildContext buildcontext){
      return MaterialButton(
        disabledColor: Colors.red[400],
        onPressed: null,
        child: null,
        color: Colors.blue,
      )
    };
  }



}
