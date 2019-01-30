import 'package:flutter/material.dart';
import 'presentation/custom_icons.dart';

class Board{
  var boards = List<SubBoard>();
  var logic = Logic(); //gives access to static logic variables
  Board(){
    initBoard();
  }

  void initBoard(){ //creates the 9 subboards
    for(int i = 0; i < 9; i++){
      boards.add(SubBoard(i));
    }
  }

  GridView getBoard(){
    return GridView.count( //places subboards in 3x3 grid
      crossAxisCount: 3,
      children: List.generate(9, (i) => boards[i].getTicTacs()),
      shrinkWrap: true,
      physics: ScrollPhysics(),
    );
  }

}

class SubBoard{
  var fields = List<TicTac>(); //the 9 fields of this board
  var logic = Logic(); //access to static logic variables

  TicTac state;
  int pos; //the position of this board

  SubBoard(int pos){
    this.pos = pos;
    initSubBoard();
  }

  void initSubBoard(){
    for(int i = 0; i < 9; i++){
      fields.add(TicTac(i, this.pos)); //adds 9 fields to the subboard
    }
  }

  GridView getTicTacs(){
    return GridView.count( //builds the subboard using padding and the 9 fields
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
  int pos; //fields position in the subboards
  int superPos; //the position of the parenting subboard of this fields
  String type; //whether the field holds cross or circle

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

  var logic = Logic(); //access to static logic variables

  var myIcon = Icon(Icons.fiber_manual_record); //the empty icon settings
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
    return IconButton( //builds the field from icon settings
      iconSize: _iconSize,
      icon: myIcon,
      onPressed: onPressingMethodCallActionDoingOfThings123,
      color: iconColor,
    );
  }



  void onPressingMethodCallActionDoingOfThings123() {
    setState(() {


      if (type == null && (superPos == logic.getNextBoard() || logic.getNextBoard() == -1)) {
        //If: 1. the field is empty, 2. this subboard is allowed to be pressed (-1 meaning that all boards are allowed to be pressed)

        type = logic.getTurn();  //the type of this field is set to the current turn
        logic.updateLogic(pos, superPos); //Changes turn

        if (type == "cross") //updates icon and color
          {
            myIcon = Icon(CustomIcons.spotify);
            iconColor = Colors.green;
          }
        else {
        myIcon = Icon(CustomIcons.facebook_circled);
        iconColor = Colors.lightBlue;
      };
        _iconSize = 30;
      }
    });
  }
}
class Logic{
  static int nextBoard = -1;//the board that the player is allowed to choose. -1 for all boards
  static String turn = "cross"; //the current turn

  static var fields_list = List.generate(81, (i) => 0); //list of all fields in entire board. 0 for empty, 1 for cross, 2 for circle

  Logic();



  void updateLogic(int next, int subIdx) {
    fields_list[9 * subIdx + next] = (turn == "cross" ? 1 : 2 ); //updates the field which was just pressed

    int winner = whoWon(subIdx); //checks whether the sub board is won
    if (winner != 0){
    print(winner.toString() + turn + " winner board number " + subIdx.toString());
    }


    nextBoard = next; //uses the just pressed field as the next allowed sub board

    if (turn == "cross") turn = "circle"; //changes turn
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
        if ( val == oldVal && val != 0){ //if values are the same and not empty
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

