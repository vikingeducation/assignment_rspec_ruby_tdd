require_relative 'player'
require_relative 'human'
require_relative 'computer'
require_relative 'dice'

class DiceThrower
  attr_accessor :last_player_number

  def initialize(human = nil, computer = nil)
    @human = human || Human.new(game: self)
    @computer = computer || Computer.new(game: self)
    @quit = false
    @last_player_number = nil
  end

  def welcome_message
    puts "Welcome to Dice Thrower!"
  end

  def play
    welcome_message
    loop do
      display_scores
      @human.roll
      break if quit?
      @computer.roll
      compare_rolls
    end
  end

  def display_scores
    puts "You: #{@human.score}"
    puts "Computer: #{@computer.score}"
  end

  def compare_rolls
    if @human.last_roll > @computer.last_roll
      puts "You win the round!"
      @human.score!
    elsif @human.last_roll < @computer.last_roll
      puts "Computer wins the round!"
      @computer.score!
    else
      puts "It's a draw! Half a point a piece."
      @human.half_score!
      @computer.half_score!
    end
    puts "New Round"
    puts
  end

  def quit!
    @quit = true
  end

  def quit?
    @quit
  end
end

DiceThrower.new.play
