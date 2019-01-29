import 'package:flutter/material.dart';

class Board{
  var boards = List<Widget>();
  var logic = Logic();
  Board();

}

class Logic{
  static int nextBoard; //the board that the player is allowed to choose. Null for all boards
  static String turn = "cross";

  Logic();

  void changeTurn(next) {
    nextBoard = next;

    if (turn == "cross") turn = "circle";
    else turn = "cross";
  }

  int getNextBoard(){return nextBoard;}

  String getTurn(){return turn;}
}

class SubBoard{
  var fields;
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

}

class TicTac extends StatefulWidget {
  int pos;
  int superPos;

  TicTac(pos, superPos){
    this.pos = pos;
    this.superPos = superPos;
  }




  @override
  _TicTacWidgetState createState() => _TicTacWidgetState();
}

class _TicTacWidgetState extends State<TicTac> {
  String type;

  var logic = Logic();

  set pos(int val) => setState(() => pos = val);
  set superPos(int val) => setState(() => superPos = val);


  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.close),
      color: Colors.red[10],
      onPressed: onPressingMethodCallActionDoingOfThings123,
    );
  }



  void onPressingMethodCallActionDoingOfThings123() {
    setState(() {
      if (type == null && pos == logic.getNextBoard()) {
        //If it is empty and this is the current subboard

        logic.changeTurn(superPos); //Changes turn
        type = logic.getTurn();
      }
    });
  }
}