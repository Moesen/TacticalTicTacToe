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

  TicTac(pos, superPos){
    this.pos = pos;
    this.superPos = superPos;
  }

  @override
  State<StatefulWidget> createState() {
    return new _TicTacWidgetState(this.pos, this.superPos);
  }
}

class _TicTacWidgetState extends State<TicTac> {
  String type;

  int pos;
  int superPos;

  var logic = Logic();
  var myIcon;

  _TicTacWidgetState(pos, superPos){
    this.pos = pos;
    this.superPos = superPos;
  }

  @override
  Widget build(BuildContext context) {
    return buildAButton();
  }

  MaterialButton buildAButton(){
    return MaterialButton(
      splashColor: Colors.blue,
      onPressed: onPressingMethodCallActionDoingOfThings123,
      color: Colors.deepOrange[200],

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
}

