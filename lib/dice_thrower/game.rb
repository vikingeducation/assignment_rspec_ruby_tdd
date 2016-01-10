require_relative 'player'
require_relative 'human'
require_relative 'computer'


class Game 

  def initialize
    @player1 = Human.new
    @player2 = Player.new
  end


  def play
    system("clear")
    print_instructions
    num_rolls = @player1.user_input

    @player1.dice, @player2.dice = num_rolls

    # human's moves
    player_rolls_dice(@player1.dice, @player1)

    # computer's moves



  end



  def print_instructions
    puts "Welcome to Dice Thrower 2000!"
    puts "The point of the game is to get the highest score."
    puts "You will roll dice against the computer."
    puts "How many dice would you like to roll?"
  end


  def player_rolls_dice(num_rolls, player)
    num_rolls.times do |single_roll|
      single_score = player.random_die
      puts "Roll #{single_roll}: #{single_score}"
      player.score += single_score
    end
  end


end


game = Game.new
game.play