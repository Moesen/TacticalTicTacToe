String whoWon(subboard_list){
     //function takes list of entire board and index of changed tile
     //returns str winning type of subboard. null for no winner

     final List<List<TicTac>> evaluateIdxes = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]];
    //the list of possible win combinations on a board

    for(List<TicTac> evalIdxes in evaluateIdxes){ //evaluates all possible win combinations
      int tile_similarities = 0;
      String oldVal;

      for(int idx in evalIdxes){ //tracks whether the type of tile changes over a combination
        var val = subboard_list[idx].type;
        if ( val == oldVal && val){ //if values are the same and not null
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

