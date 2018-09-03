# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [2,4,6],  # Diagonal 1
  [0,4,8],  # diagonal 2
  [0,3,6],  # left
  [1,4,7],  # Middle
  [2,5,8]  # right
]

def won?(board)
   if board.all? {|index| index == " "  }
     false
   else
     WIN_COMBINATIONS.each do |win_combination|

        win_array  = win_combination.select {|index| (board[index] == "X")}
        win_array2 = win_combination.select {|index| (board[index] == "O")}
        if win_array.length == 3
          return win_array
        end
        if win_array2.length == 3
         return win_array2
        end

      end
      return false
   end
end

def full?(board)
  board.all? {|position| position == "X" or position == "O"}
end

def  draw?(board)
  if won?(board) != false   # return false for in-progress game
    return false
  else
    return true
  end
end

 def over?(board)
   if draw?(board) == true    #if draw is true tes if there's empty index
     return !board.any? {|index| index == " "}
   end
   if draw?(board) == true or won?(board) != false
     return true
   end
 end

def winner(board)
  array = won?(board)
  if array != false
    if board[array[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end
