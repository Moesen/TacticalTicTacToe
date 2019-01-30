class Logic {
  static int nextBoard =
      -1; //the board that the player is allowed to choose. -1 for all boards
  static String turn = "cross"; //the current turn

  static var fields_list = List.generate(
      81,
      (i) =>
          0); //list of all fields in entire board. 0 for empty, 1 for cross, 2 for circle

  static var won_subBoards = List.generate(9, (i) => 0);

  static var turnTxt;
  static var board;
  static var turnsUsed;

  Logic();

  void updateLogic(int next, int subIdx) {
    fields_list[9 * subIdx + next] =
        (turn == "cross" ? 1 : 2); //updates the field which was just pressed

    int winner = whoWon(fields_list.sublist(
        subIdx * 9, subIdx * 9 + 9)); //checks whether the sub board is won
    if (winner != 0) {
      board.state.setSubboardAsWinner(winner, subIdx);
    }

    if (won_subBoards[next] == 0) {
      setAllAsInactive();

      nextBoard =
          next; //uses the just pressed field as the next allowed sub board
      board.state.boards[next].state.setThisAsActive();
    } else {
      setAllAsActive();
      nextBoard = -1;
    }

    if (turn == "cross")
      turn = "circle"; //changes turn
    else
      turn = "cross";

    turnTxt.state.setTxt();

    turnsUsed ++;
  }

  int getNextBoard() {
    return nextBoard;
  }

  String getTurn() {
    return turn;
  }

  int whoWon(List boardList) {
    //function takes list of entire board and index of changed subboard

    //returns str winning type of subboard. null for no winner
    final List<List<int>> evaluateIdxes = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];
    //the list of possible win combinations on a board

    for (List<int> evalIdxes in evaluateIdxes) {
      //evaluates all possible win combinations
      int tile_similarities = 0;
      int oldVal;

      for (int idx in evalIdxes) {
        //tracks whether the type of tile changes over a combination
        var val = boardList[idx];
        if (val == oldVal && val != 0) {
          //if values are the same and not empty
          tile_similarities++;
        }
        oldVal = boardList[idx];
      }

      if (tile_similarities == 2) {
        //if all values in the win combination are the same, the board is won
        return oldVal;
      }
    }
    return 0;
  }

  void isTheGameWon() {
    print(won_subBoards);
    int winner = whoWon(won_subBoards);
    if (winner != 0) {
      turnTxt.state.declareWinner(turn);
    }
  }

  void setAllAsInactive() {
    for (int i = 0; i < 9; i++) {
      board.state.boards[i].state.setThisAsInactive();
    }
  }

  void setAllAsActive() {
    for (int i = 0; i < 9; i++) {
      board.state.boards[i].state.setThisAsActive();
    }
  }

  void setTurnTxt(txt) {
    turnTxt = txt;
  }

  void setSubBoardWinner(idx, winner) {
    won_subBoards[idx] = winner;
  }

  void setBoard(b) {
    board = b;
  }
}
