require "board"

class TowerOfHanoi

  def initialize(number_of_discs)
    raise "Discs fewer than 3" if number_of_discs < 3

    @board = Board.new(number_of_discs)
    #@player = Player.new
  end


  def play
    #loop will start here
    get_move

  end


  def get_move
    gets.chomp
  end

end