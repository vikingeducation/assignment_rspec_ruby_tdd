require_relative 'human'
require_relative 'computer'
require_relative 'board'

class Game
  def initialize
    @human = Human.new
    @computer = Computer.new
    @board = Board.new
  end

  def play
      instruction
      input = @human.get_input
      player = @human.roll_dice(input)
      computer = @computer.roll_dice(input)
      @board.print_choices(player, computer)
      @board.check_victory(player, computer)
      @board.render
  end

  def instruction
    puts "hello, choose a number of dice, or press 'q' to exit "
  end

end

# game = Game.new
# game.play