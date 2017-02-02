
class Game

  attr_accessor :game

  def initialiize
    @player = Player.new
    @computer = Computer.new
    @dice = Dice.new(6)
  end

  def play
    puts "Welcome to Dice Thrower"
    puts "Instructions:"
    puts "Enter how many dice you'd like to throw"
    puts "If your total is higher than the computer, you win!"
    puts "Enter 'q' to quit."
    puts ""
    puts "***** SCORE *****"
    puts "You:  0 wins"
    puts "Clue: 0 wins"
    puts "*****************"
    puts ""
    puts "Enter number of dice to throw >"
  end

  # output running total
  def render
  end

  def check_who_won
  end

end