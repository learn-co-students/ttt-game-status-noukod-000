# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left vertical
  [1,4,7],  # middle vertical
  [2,5,8],  # bottom vertical
  [0,4,8],  # left diagonal
  [2,4,6]  # right diagonal
]

def won?(board)

  WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = board[win_index_1] # load the value of the board at win_index_1
        position_2 = board[win_index_2] # load the value of the board at win_index_2
        position_3 = board[win_index_3] # load the value of the board at win_index_3

        if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
           return win_combination # return the win_combination indexes that won.
        end
  end
  return false
end

def full?(board)
  return board.all?{|element| element=="X" || element=="O"}
end

def draw?(board)
    if full?(board)
      (won?(board).class==Array)?false:true
    else
      false
    end
end

def over?(board)
    full?(board) || won?(board) || draw?(board)
end

def winner(board)
   if(won?(board).class==Array)
     win_indexes=won?(board)
     a_winning_index=win_indexes[0]
     board[a_winning_index]
   else
     nil
   end
end
