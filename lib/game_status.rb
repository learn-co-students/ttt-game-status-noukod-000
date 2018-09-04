# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def won? board
  if board.all?{|cell| cell == "" || cell == " "}
    false
  else
    row_win = nil
    WIN_COMBINATIONS.each do |win_combination|
      if win_combination.all?{|cell| board[cell] == 'X'} || win_combination.all?{|cell| board[cell] == 'O'}
      # if (board[win_combination[0]] == board[win_combination[1]] &&
      #   board[win_combination[0]] == board[win_combination[2]] &&
      #   board[win_combination[0]] == 'X') ||
      #   (board[win_combination[0]] == board[win_combination[1]] &&
      #     board[win_combination[0]] == board[win_combination[2]] &&
      #     board[win_combination[0]] == 'O')
        row_win = win_combination
      end
    end
    return row_win
  end

  false
end

def full? board
  x_arrays = board.select do |cell|
    cell == 'X'
  end

  o_arrays = board.select do |cell|
    cell == 'O'
  end

  (x_arrays.size + o_arrays.size) == 9
end

def draw? board
  if (!(won? board)) && (full? board)
    return true
  end

  if (!(won? board)) && (!full? board)
    return false
  end

  if (won? board)
    return false
  end
end

def over? board
  (won? board) || (full? board) || (draw? board)
end

def winner board
  x_arrays = board.select do |cell|
    cell == 'X'
  end

  o_arrays = board.select do |cell|
    cell == 'O'
  end

  if x_arrays.size > o_arrays.size
    return 'X'
  elsif x_arrays.size < o_arrays.size
    return 'O'
  else
    return nil
  end
end
