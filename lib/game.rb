require_relative 'player'

class Game
  attr_reader :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new
  end

  def play
    intro
    loop do
      number_of_dice = @human.choose_number
      @human.throws(number_of_dice)
      @computer.throws(number_of_dice)
      throw_results
      declare_winner
      compare_scores
      break unless @human.play_again?
    end
    goodbye
  end

  def intro
    puts puts puts
    puts "Welcome to Dice Thrower!"
    puts
    puts "Instructions:"
    puts "Enter how many dice you'd like to throw."
    puts "If your total is higher than the computer, you win!"
  end

  def throw_results
    puts
    puts "~~~~~THROW RESULTS~~~~~"
    puts "You      :#{@human.throw}"
    puts "Computer :#{@computer.throw}"
    puts "~~~~~~~~~~~~~~~~~~~~~~~"
  end

  def declare_winner
    return "It's a tie!" if tie?
    winner = find_winner
    puts puts
    puts "The #{winner} was the winner this time!"
    puts puts
    record_score
  end

  def tie?
    @human.throw == @computer.throw
  end

  def find_winner
    @human.throw > @computer.throw ? "human" : "computer"
  end

  def record_score
    find_winner == "human" ? @human.scores : @computer.scores
  end

  def compare_scores
    puts puts
    puts "********** SCORE **********"
    puts "You      : #{@human.score} wins"
    puts "Computer : #{@computer.score} wins"
    puts "***************************"
  end

  def goodbye
    puts puts puts
    puts "bye loser"
    puts puts puts
  end
end