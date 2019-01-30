import 'package:flutter/material.dart';
import 'presentation/custom_icons.dart';

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
      padding: EdgeInsets.all(5),
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
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
  var myIcon = Icon(Icons.fiber_manual_record);
  double _iconSize = 5;
  var iconColor = Colors.deepOrange;

  _TicTacWidgetState(pos, superPos, type){
    this.pos = pos;
    this.superPos = superPos;
    this.type = type;
  }

  @override
  Widget build(BuildContext context) {
    return buildAButton();
  }

  IconButton buildAButton(){
    return IconButton(
      iconSize: _iconSize,
      icon: myIcon,
      onPressed: onPressingMethodCallActionDoingOfThings123,
      color: iconColor,
    );
  }



  void onPressingMethodCallActionDoingOfThings123() {
    setState(() {


      if (type == null && (superPos == logic.getNextBoard() || logic.getNextBoard() == -1)) {
        //If it is empty and this is the current subboard

        logic.updateLogic(pos, superPos); //Changes turn
        type = logic.getTurn();
        myIcon = (type == 'cross' ? Icon(CustomIcons.spotify) : Icon(CustomIcons.facebook_circled));
        _iconSize = 30;
        iconColor = (type == 'cross' ? Colors.green : Colors.lightBlue);
      }
    });
  }
}
class Logic{
  static int nextBoard = -1;//the board that the player is allowed to choose. Null for all boards
  static String turn = "cross";

  var fields_list = List.generate(81, (i) => 0);

  Logic();



  void updateLogic(int next, int subIdx) {
    fields_list[9 * subIdx + next] = (turn == "cross" ? 1 : 2 );

    int winner = whoWon(subIdx);
    if (winner != 0){
    print(winner.toString() + turn + " winner board number " + subIdx.toString());
    }


    nextBoard = next;

    if (turn == "cross") turn = "circle";
    else turn = "cross";
  }

  int getNextBoard(){
    print("this is next: " + nextBoard.toString());
    return nextBoard;
  }

  String getTurn(){return turn;}

  int whoWon(int subIdx){
    //function takes list of entire board and index of changed subboard

    var subboard_list = fields_list.sublist(subIdx*9, subIdx*9+9);

    //returns str winning type of subboard. null for no winner

    final List<List<int>> evaluateIdxes = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]];
    //the list of possible win combinations on a board

    for(List<int> evalIdxes in evaluateIdxes){ //evaluates all possible win combinations
      int tile_similarities = 0;
      int oldVal;

      for(int idx in evalIdxes){ //tracks whether the type of tile changes over a combination
        var val = subboard_list[idx];
        if ( val == oldVal && val != 0){ //if values are the same and not null
          tile_similarities++;
        }
        oldVal = subboard_list[idx];
      }

      if(tile_similarities == 2){ //if all values in the win combination are the same, the board is won
        return oldVal;
      }
    }
    return 0;
  }

}

