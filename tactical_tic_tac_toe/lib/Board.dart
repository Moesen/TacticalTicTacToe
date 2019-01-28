import 'package:flutter/material.dart';

class Board extends GridView{
  var boards = List<Widget>();


  Board(){
    initBoard();
    super.count(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 3,
        children: boards
    );

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
class TicTac extends IconButton{
  TicTac() : super(icon: Icon(Icons.menu), onPressed: null);
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
  }

  String getTicTac(){
    switch (this.type){
      case "cross": return this.type;
      case "circle": return this.type;
    }
    return "empty";
  }

}
