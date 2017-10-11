require 'pry'

# Build a simple game where a human player enters a number of
# dice and then rolls that many different 6-sided dice. The
# computer then rolls the same number of dice. The player with
# the higher total sum wins the round. Score is kept on a running
# basis until the game is exited.

class Game
  attr_reader :qty_dice, :players, :play_again

  def initialize
    @qty_dice = 0
    @players = [Human.new, Computer.new]
    @play_again = true
  end

  def play
    welcome_player
    until @play_again == false
      play_round
      @play_again = play_again?
    end
    exit_game
  end

  private

  def welcome_player
    puts "Welcome to Dice Thrower"
    puts "Instructions:"
    puts "Enter how many dice you'd like to throw"
    puts "If your total is higher than the computer, you win!"
    puts "Enter 'q' to quit."
  end

  def play_round
    request_dice_count
    @players.each do |player|
      player.round_score = roll_dice(player.name)
      sleep 1
    end
    evaluate_round_winner
    sleep 1
    display_scores
  end

  def request_dice_count
    puts "", "Please enter the number of dice you want to play with:"
    @qty_dice = request_input
  end

  def roll_dice(player_name)
    dice = Die.new(@qty_dice, 6)
    dice.roll_all(player_name)
  end

  def evaluate_round_winner
    if @players[0].round_score == @players[1].round_score
      puts "It's a tie!"
    else
      winner = @players.max_by(&:round_score)
      winner.game_score += 1
      puts "#{winner.name} won the round"
    end
  end

  def display_scores
    puts "","***** SCORE *****"
    @players.each do |player|
      puts " #{player.name}: #{player.game_score}"
    end
    puts "*****************"
  end

  def play_again?
    puts "Play again? y | n"
    response = gets.chomp.downcase
    return false unless response == 'y'
  end

  def request_input
    input = gets.chomp
    input.downcase == 'q' ? exit_game : input.to_i
  end

  def exit_game
    puts 'Bye!'
    exit
  end
end


class Die
  attr_reader :qty, :sides

  def initialize(qty, sides)
    @qty = qty
    @sides = sides
  end

  def roll_all(player_name)
    puts "rolling..."
    total = 0
    qty.times do
      total += roll
    end
    puts "#{player_name} rolled a total of #{total}",""
    total
  end

  private

  def roll
    result = (1..sides).to_a.sample
    puts "...#{result}"
    result
  end
end


class Player
  attr_accessor :round_score, :game_score

  def initialize
    @round_score = 0
    @game_score = 0
  end
end

class Human < Player
  def name
    "You"
  end
end

class Computer < Player
  def name
    "Computer"
  end
end

# Game.new.play