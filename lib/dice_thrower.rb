require 'board'
require 'player'
require 'human'
require 'computer'
require 'view'

class DiceThrower

  def initialize
    @player1 = Human.new
    @player2 = Player.new
    @board = Board.new([@player1, @player2])
  end



end
