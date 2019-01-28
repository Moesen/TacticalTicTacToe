class Board{
  var boards = List<SubBoard>();

  Board(){
    initBoard();
  }

  void initBoard(){
    for(int i = 0; i < 9; i++){
      boards.add(SubBoard());
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
}

/**
 * Use this to change the type.
 * If not changed change and return true,
 * else retunr false
 */
class TicTac{
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
