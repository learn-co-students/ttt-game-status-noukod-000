# Helper Method
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
                  ]
                  
                  
    #verify whether the game is won 
    def  won?(board)
       
       WIN_COMBINATIONS.each {|i|
          #get win combinations at each loops
        win_1= i[0]
        win_2 = i[1]
        win_3 = i[2]
          
          
        pos_1 = board[win_1]
        pos_2 = board[win_2]
        pos_3 = board[win_3]
        
        if(pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
          return i
        elsif (pos_1 == "X" && pos_2 == "X" && pos_3 == "X")
          return i
        end
         }
         return false
   end 
    
    #verify if board is full
    def full?(board)
     !(board.include?(" "))
    end
    
    
    #verify draw
    def draw?(board)
      if !won?(board) && full?(board)
        return true
      else 
        return false
      end
    end
    
   
    def over?(board)
      
      if draw?(board) || won?(board) || full?(board)
        return true
      else
        return false
      end
      
    end
    
    def winner(board)
      save = won?(board)
      if save == false
        return nil
      end
      if board[save[0]] == "X"
        return "X"
      elsif board[save[0]] == "O"
        return "O"
      end
    end