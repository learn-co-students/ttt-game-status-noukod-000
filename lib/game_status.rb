# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]

  def display_board(
  board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    puts 'display board'
  #board output
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  # def won?(board)
  #   WIN_COMBINATIONS.each do |win_combo|
  #     #check for player 1 win
  #     if check_win_combination?(board, 'X', win_combo)
  #       return win_combo
  #       #check for player 2 win
  #     elsif check_win_combination?(board, 'O', win_combo)
  #       return win_combo
  #
  #
  #     else
  #       return false
  #     end
  #   end
  # end

  def full?(board)
    if board.include?(' ') || board.include?('')
      return false
  else
      return true
    end
  end

  #IS THERE A DRAW?
  def draw?(board)
     full?(board) && won?(board) == nil
  end


def over?(board)
  if draw?(board) || won?(board)
  full?(board)
  return true
else
  return false
end
end
#WHO WON?
def won?(board)
  WIN_COMBINATIONS.find do |combo|
    # original argument "position_taken?(board, combo)"
    position_taken?(board, combo[0]) &&
    board[combo[0]] == board[combo[1]] &&
    board[combo[0]] == board[combo[2]]
  end
end

#WHO WON?
def winner(board)
  if won?(board)
   return board[won?(board)[0]]
  end
end
