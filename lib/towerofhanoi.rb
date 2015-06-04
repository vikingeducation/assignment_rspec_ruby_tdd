require "board"
require "player"

class TowerOfHanoi

  def initialize(number_of_discs)
    raise "Discs fewer than 3" if number_of_discs < 3

    @board = Board.new(number_of_discs)
    @player = Player.new
  end


  def get_move
    @player.input_move
  end

end