class Cell

  #change to reader!!!
  attr_accessor :type, :visible, :value

  def initialize(type = "blank")
    @type = type
    @value = 0
    @visible = false
  end

  def is_bomb?
    if @type == "bomb"
      return true
    else
      return false
    end
  end

  def is_visible?
    if @visible == false
      return false
    else
      return true
    end
  end

end

  # def is_number?
  #   if @type.is_a? Integer
  #     return true
  #   else
  #     return false
  #   end
  # end

  # def add_numbers

  # end



class Board 
  attr_reader :game_board

  def initialize(x = 10,y = 10)    

    @game_board = Array.new(x) { Array.new(y) { Class.new} }
    rand_bomb_adder(x,y)
    # puts @game_board
  end
  
  def rand_bomb_adder(x,y)
    
    (x).times do
      rand_x_array=(0...x).to_a
      rand_y_array =(0...y).to_a

      rand_x_pos = rand_x_array.sample
      rand_x_array.delete_at(rand_x_pos)

      rand_y_pos = rand_y_array.sample
      rand_y_array.delete_at(rand_y_pos)

      @game_board[rand_x_pos][rand_y_pos] = 
    end
    @game_board
    
  end

  # def render
  #   p @game_board
  # end


end

class Minesweeper


end