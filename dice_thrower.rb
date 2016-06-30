require 'pry'
class Dice
  def self.roll(num_dice = 1)
    sum = 0
    num_dice.times { sum += rand(1..6) }
    sum
  end
end

class Player
  attr_reader :name, :current_score, :num_wins
  def initialize(name = :human)
    @name = name
    @current_score = 0
    @num_wins = 0
  end

  def roll_dice(num_dice = 1)
    @current_score = Dice.roll(num_dice)
  end

  def get_num_dice
    puts "Please enter how many dice you would like to roll [1..10]>"
    input = gets.chomp.to_i
    loop do
      break if (1..10).include?(input)
      exit if input == 0
      puts "please enter a valid input [1..10]"
    end
    input
  end
  def incr_wins
    @num_wins += 1
  end
end

class Game
  attr_reader :player1, :player2
  attr_writer :num_dice
  def initialize
    @player1 = Player.new(:human)
    @player2 = Player.new(:computer)
    @num_dice = 1
  end
  def calculate_winner(player1, player2)
    return player1 if player1.current_score > player2.current_score
    return player2 if player1.current_score < player2.current_score
    nil
  end

  def print_score
    puts "# ***** This Roll *****"
    puts "You     : #{player1.current_score}"
    puts "Computer: #{player2.current_score}"
    puts
    puts "# ***** SCORE *****"
    puts "# You     : #{player1.num_wins} wins"
    puts "# Computer: #{player2.num_wins} wins"
    puts "# *****************"
  end

  def play
    loop do
      num_dice = player1.get_num_dice
      player1.roll_dice(num_dice)
      player2.roll_dice(num_dice)
      winner = calculate_winner(player1, player2)
      winnner ? winner.incr_wins : nil
      print_score
    end
  end
end
