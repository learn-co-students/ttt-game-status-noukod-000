# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],  [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8],   [2,4,6]  ] #Bottom row
 #Right start diagonal   # Top row | Middle row |  #Left column |  #Left column |  #Middle |#Left start |  diagonal column |#Right column |   #Left column


board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
#methode which 

def won?(board)
  row_win =[]
  empty_board= board.all? {|x| x ==" "}
  WIN_COMBINATIONS.each do |row_win_position|
   # row_win_position.each do |board|
     # if empty_board || full?(board)
       # return false
      #else
      
        win_index_1 = row_win_position[0]
        win_index_2 = row_win_position[1]
        win_index_3 = row_win_position[2]
        position_1 = board[win_index_1]
        position_2 = board[win_index_2]
        position_3 = board[win_index_3]
      
             if position_1 == "X" && position_2 == "X" && position_3 == "X"
               return row_win_position
             elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
              return row_win_position
            
        end
      
       
        
    end
      return false
        
end
    
    
  
def full?(board)
  empty_board= board.all? {|x| x =="X" || x=="O"}
  
end

def draw?(board)
 if full?(board) && !won?(board)
   return true 
 else 
   false
 end
end

def over?(board)
  if draw?(board) || full?(board) || won?(board)
    return  true
  end
end
  
def winner(board)
 row_win = won?(board)
 if row_win == false
   return nil
 end
 if board[row_win[0]] == "X" 
   return "X"
  elsif board[row_win[0]] == "O"
  return "O"
  end
end

