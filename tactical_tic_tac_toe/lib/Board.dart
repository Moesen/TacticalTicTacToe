import 'package:flutter/material.dart';

class Board{
  var boards = List<SubBoard>();
  var logic = Logic();
  Board(){
    initBoard();
  }

  void initBoard(){
    for(int i = 0; i < 9; i++){
      boards.add(SubBoard(i));
    }
  }

  GridView getBoard(){
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(9, (i) => boards[i].getTicTacs()),
      shrinkWrap: true,
      physics: ScrollPhysics(),
    );
  }

}

class SubBoard{
  var fields = List<TicTac>();
  var logic = Logic();

  TicTac state;
  int pos;

  SubBoard(int pos){
    this.pos = pos;
    initSubBoard();
  }

  void initSubBoard(){
    for(int i = 0; i < 9; i++){
      fields.add(TicTac(i, this.pos));
    }
  }

  GridView getTicTacs(){
    return GridView.count(
      crossAxisCount: 3,
      children: fields,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      padding: EdgeInsets.all(10),
    );
  }

}


class TicTac extends StatefulWidget {
  int pos;
  int superPos;
  int type;

  TicTac(pos, superPos){
    this.pos = pos;
    this.superPos = superPos;
  }

  @override
  State<StatefulWidget> createState() {
    return new _TicTacWidgetState(this.pos, this.superPos, this.type);
  }
}

class _TicTacWidgetState extends State<TicTac> {
  String type;

  int pos;
  int superPos;

  var logic = Logic();
  var myIcon;

  _TicTacWidgetState(pos, superPos, type){
    this.pos = pos;
    this.superPos = superPos;
    this.type = type;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: ( (myIcon == null) ? Icon(Icons.remove_circle) : myIcon),
      color: Colors.red,
      onPressed: onPressingMethodCallActionDoingOfThings123,
    );
  }



  void onPressingMethodCallActionDoingOfThings123() {
    setState(() {


      if (type == null && (superPos == logic.getNextBoard() || logic.getNextBoard() == -1)) {
        //If it is empty and this is the current subboard

        logic.changeTurn(pos); //Changes turn
        type = logic.getTurn();
        myIcon = (type == "cross" ? Icon(Icons.close) : Icon(Icons.blur_circular));
      }
    });
  }
}

class Logic{
  static int nextBoard = -1;//the board that the player is allowed to choose. Null for all boards
  static String turn = "cross";

  Logic();



  void changeTurn(int next) {
    nextBoard = next;

    if (turn == "cross") turn = "circle";
    else turn = "cross";
  }

  int getNextBoard(){
    return nextBoard;
  }

  String getTurn(){return turn;}

  String whoWon(subboard_list){
    //function takes list of entire board and index of changed tile
    //returns str winning type of subboard. null for no winner

    final List<List<int>> evaluateIdxes = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]];
    //the list of possible win combinations on a board

    for(List<int> evalIdxes in evaluateIdxes){ //evaluates all possible win combinations
      int tile_similarities = 0;
      String oldVal;

      for(int idx in evalIdxes){ //tracks whether the type of tile changes over a combination
        var val = subboard_list[idx].type;
        if ( val == oldVal && val != null){ //if values are the same and not null
          tile_similarities++;
        }
        oldVal = subboard_list[idx].type;
      }

      if(tile_similarities == 2){ //if all values in the win combination are the same, the board is won
        return oldVal;
      }
    }
    return null;
  }

}

