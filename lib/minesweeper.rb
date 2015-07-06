class Board 
  attr_reader :game_board

  def initialize(x = 10,y = 10)    

    @game_board = Array.new(x) { Array.new(y) { " " } }
    p @game_board
  end
  
  def bomb_placement(x,y)
    row = rand(0...x)
    column = rand(0...y)
    
  end
end
class Minesweeper


end