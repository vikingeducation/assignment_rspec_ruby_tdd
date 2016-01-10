require_relative 'player'
require_relative 'human'


class Game 

  attr_reader :player1, :player2

  def initialize
    @player1 = Human.new
    @player2 = Player.new
  end


  def play
    system("clear")
    print_instructions
    num_rolls = @player1.user_input

    # human's moves
    puts "Here are your dice:"
    player_rolls_dice(num_rolls, @player1)

    # computer's moves
    puts "Here are the computer's dice:"
    player_rolls_dice(num_rolls, @player2)

    decide_winner(@player1.score, @player2.score)

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
      puts "Roll #{single_roll+1}: #{single_score}"
      player.score += single_score
    end
  end

  
  def decide_winner(player1_score, player2_score)
    puts "Your score: #{player1_score}"
    puts "Computer's score: #{player2_score}"
    if player1_score > player2_score
      puts "Congratulations, you win!"
      player1_score
    elsif player1_score == player2_score
      puts "It's a tie!"
    else
      puts "The computer won, sorry."
      player2_score
    end
  end



end


game = Game.new
game.play