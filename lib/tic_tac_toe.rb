class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = 
  [[0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]
  
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  
  
  def input_to_index(user_input)
    index = (user_input.to_i - 1)
  end
  
  def move(index, character = "X")
  if character == "X"
    @board[index] = "X"
  else character == "O"
    @board[index] = "O"
end
end

def position_taken?(index)
  if @board[index] == "X"
    true
  elsif @board[index] == "O"
    true
  else
    false
  end
end

def valid_move?(index)
  if (index.between?(0,8) == true) && (position_taken?(index) == false)
    return true 
  else
    return false
  end
end

def turn
  character = current_player
puts "Please enter 1-9:"
user_input = gets.strip
user_input = user_input.to_i
index = input_to_index(user_input)
 if valid_move?(index) == true
   move(index, character)
   display_board
  else 
    turn
  end
end

def turn_count
  x_turns = @board.count("X")
  o_turns = @board.count("O")
  turn_count = x_turns + o_turns
  return turn_count
end
  

def current_player
  turn_count 
  if turn_count%2 != 0 
    "O"
 else
    "X"
  end
end


def won?
for sub_array in WIN_COMBINATIONS do
index_1 = sub_array[0]
index_2 = sub_array[1]
index_3 = sub_array[2]

board_index_1 = @board[index_1]
board_index_2 = @board[index_2]
board_index_3 = @board[index_3]

 if (board_index_1 == "X" && board_index_2 == "X" && board_index_3 == "X") || (board_index_1 == "O" && board_index_2 == "O" && board_index_3 == "O") 
  return sub_array
end
end
false
end

def full?
  if @board.include?(" " || "" || nil)
    false
  else
    true 
  end 
end

def draw?
  if won?
    return false
  elsif !full?
    false 
  else
    puts "Cat's Game!"
    true
end 
end 

def over?
 if draw? 
   return true
elsif won?
  return true 
else
  false 
end
end

def winner
sub_array = won?
  if won? == false
    return nil
  elsif @board[sub_array[1]] == "X"
   return "X"
  elsif @board[sub_array[1]] == "O"
   return "O"
end
end

end