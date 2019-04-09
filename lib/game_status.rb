# Helper Method
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,4,8],[2,4,6],[0,3,6],[1,4,7],[2,5,8]]
  
  def won?(board)
   WIN_COMBINATIONS.each {|win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
if position_1 == "X" && position_2 == "X" && position_3 == "X" ||  position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
 end
   }
   return false
  end
  
def full?(board)
 all_X_O = board.all? do |elem|
  elem == "X" || elem == "O"
end
end

def draw?(board)
  if won?(board)
  return false
  else if full?(board) && !won?(board) 
  return true
else if !won?(board) && !full?(board)
  return false
end
end
end
end


def over?(board)
  if won?(board) && draw?(board) || full?(board)
  return true
else if won?(board) && !full?(board)
  return true
else
  return false
end
end
end

def winner(board)
  won_var = won?(board)
    if won_var == false
      return nil
    else if board[won_var[0]] == "X"
      return "X"
      else if board[won_var[0]] == "O"
      return "O"
    end
    end
    end
end