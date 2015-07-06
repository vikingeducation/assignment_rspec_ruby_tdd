class Board 
  attr_reader :game_board

  def initialize(x = 10,y = 10)    

    @game_board = Array.new(x) { Array.new(y) { " "} }
    rand_bomb_adder(x,y)
    # puts @game_board
  end

  def render

    @game_board.each do |line|
      line.each do |cell|
        print cell
      end
      print "\n"
    end
  end

  
  def rand_bomb_adder(x,y)
    
    (x).times do
      rand_x_array=(0...x).to_a
      rand_y_array =(0...y).to_a

      rand_x_pos = rand_x_array.sample
      rand_x_array.delete_at(rand_x_pos)

      rand_y_pos = rand_y_array.sample
      rand_y_array.delete_at(rand_y_pos)

      @game_board[rand_x_pos][rand_y_pos] = "B"
    end
    @game_board
    
  end

  def number_hints
    @game_board.each_with_index do |line, index|
      line.each_with_index do |cell, index_two|
         if cell == "B" 
            index_two > 0 ? @game_board[index][index_two -1] = 1 : @game_board[index][index_two -1]  = " "
            @game_board[index][index_two +1] = 1
          end
      end
    end
     

  end


end

class Minesweeper


end