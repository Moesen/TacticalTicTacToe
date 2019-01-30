import 'package:flutter/material.dart';

import 'logic.dart';

class Board extends StatefulWidget {
  var turnTxt;
  State state;

  Board(turnTxt) {
    this.turnTxt = turnTxt;
  }

  @override
  State<StatefulWidget> createState() {
    state = new _BoardState(turnTxt);

    return state;
  }
}

class _BoardState extends State<Board> {
  var boards = List<SubBoard>();
  var logic = Logic(); //gives access to static logic variables

  _BoardState(turnTxt) {
    initBoard();
    logic.setTurnTxt(turnTxt);
  }

  @override
  Widget build(BuildContext context) {
    return getBoard();
  }

  void setSubboardAsWinner(int winner, int subIdx) {
    logic.setSubBoardWinner(subIdx, winner);
    _SubBoardState wonBoard = boards[subIdx].state;
    wonBoard.setAsWon(winner);

    logic.isTheGameWon();
  }

  void initBoard() {
    //creates the 9 subboards
    for (int i = 0; i < 9; i++) {
      boards.add(SubBoard(i));
    }
  }

  GridView getBoard() {
    return GridView.count(
      //places subboards in 3x3 grid
      crossAxisCount: 3,
      children: boards,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      shrinkWrap: true,
      physics: ScrollPhysics(),
    );
  }
}

class SubBoard extends StatefulWidget {
  int pos; //the position of this board
  State state;

  SubBoard(int pos) {
    this.pos = pos;
  }

  @override
  State<StatefulWidget> createState() {
    state = new _SubBoardState(pos);
    return state;
  }
}

class _SubBoardState extends State<SubBoard> {
  var fields = List<TicTac>(); //the 9 fields of this board
  var logic = Logic(); //access to static logic variables

  var thisColor = Colors.black12;

  bool won = false;

  var thisIcon;
  int pos;

  _SubBoardState(int pos) {
    this.pos = pos;
    initSubBoard();
  }

  void initSubBoard() {
    //adds 9 fields to the subboard
    for (int i = 0; i < 9; i++) {
      fields.add(TicTac(i, this.pos));
    }
  }

  @override
  Widget build(BuildContext context) {
    return getTicTacs();
  }

  Container getTicTacs() {
    if (won == false) {
      return Container(
        child: Column(children: <Widget>[
          Expanded(
            child: Row(children: fields.sublist(0, 3)),
          ),
          Expanded(
            child: Row(children: fields.sublist(3, 6)),
          ),
          Expanded(
            child: Row(children: fields.sublist(6, 9)),
          ),
        ]),
        decoration: new BoxDecoration(color: thisColor),
      );
    } else {
      return Container(
        child: thisIcon,
        decoration: new BoxDecoration(color: thisColor),
      );
    }
  }

  void setAsWon(int winner) {
    setState(() {
      won = true;
      thisIcon = winner == 1
          ? Icon(Icons.close, color: Colors.green, size: 100)
          : Icon(Icons.radio_button_unchecked,
              color: Colors.lightBlue, size: 100);
    });
  }

  void setThisAsActive() {
    setState(() {
      thisColor = Colors.black26;
    });
  }

  void setThisAsInactive() {
    setState(() {
      thisColor = Colors.black12;
    });
  }
}

class TicTac extends StatefulWidget {
  int pos; //fields position in the subboards
  int superPos; //the position of the parenting subboard of this fields
  String type; //whether the field holds cross or circle

  State state;

  TicTac(pos, superPos) {
    this.pos = pos;
    this.superPos = superPos;
  }

  @override
  State<StatefulWidget> createState() {
    state = new _TicTacWidgetState(this.pos, this.superPos, this.type);
    return state;
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

  _TicTacWidgetState(pos, superPos, type) {
    this.pos = pos;
    this.superPos = superPos;
    this.type = type;
  }

  @override
  Widget build(BuildContext context) {
    return buildAButton();
  }

  Expanded buildAButton() {
    return Expanded(
        child: Container(
            child: IconButton(
              //builds the field from icon settings
              iconSize: _iconSize,
              icon: myIcon,
              onPressed: onPressingMethodCallActionDoingOfThings123,
              color: iconColor,
            ),
            decoration: new BoxDecoration(color: null)));
  }

  void onPressingMethodCallActionDoingOfThings123() {
    setState(() {
      if (type == null &&
          (superPos == logic.getNextBoard() || logic.getNextBoard() == -1)) {
        //If: 1. the field is empty, 2. this subboard is allowed to be pressed (-1 meaning that all boards are allowed to be pressed)

        type =
            logic.getTurn(); //the type of this field is set to the current turn
        logic.updateLogic(pos, superPos); //Changes turn

        if (type == "cross") //updates icon and color
        {
          myIcon = Icon(Icons.close);
          iconColor = Colors.green;
        } else {
          myIcon = Icon(Icons.radio_button_unchecked);
          iconColor = Colors.lightBlue;
        }
        ;
        _iconSize = 30;
      }
    });
  }
}
