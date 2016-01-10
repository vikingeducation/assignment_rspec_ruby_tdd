
require_relative '../lib/computer.rb'
require_relative '../lib/human.rb'
require_relative '../lib/dice.rb'

class Game
  
  @@MAX_DICE = 10
  ERRORS = {"wrong_current_player" => "Current player is not human or computer!"}

  attr_accessor :dice, :computer, :human

  def initialize()
    @dice = Dice.new
    @computer = Player.build_computer
    @human = Player.build_human
  end

  def start_turn
    [@human,@computer].sample
  end

  def get_opponent(current_player)
    raise (ERRORS["wrong_current_player"])\
    if ![@human.class,@computer.class].include?(current_player.class)

    current_player == @human? (@computer) : (@human)

  end

  def print_msg(msg)
    puts $msg
  end

  def print_instructions 
    puts ""
    puts "" 
    puts "******************************************************"
    puts "Welcome to Dice Thrower"
    puts "# Instructions:"
    puts "Enter how many dice you'd like to throw"
    puts "If your total is higher than the computer, you win!"
    puts "Enter 'q' to quit."
    puts "******************************************************"
    puts ""
    puts ""
  end

  def render
    puts ""
    puts ""
    puts "******************** SCORE **********************"
    puts "YOU : #{@human.wins},  COMPUTER: #{@computer.wins}"
    puts "******************** ***************************"
    puts ""
    puts ""

  end


  def play
    print_instructions

    player_1 = start_turn
    player_2 = get_opponent(player_1)
    
    loop do
      
      @dice.num_dice = @human.ask_how_many_dice?(@@MAX_DICE)
      
      player_1.score = dice.roll_all_dice
      player_1.print_round_total

      player_2.score = dice.roll_all_dice
      player_2.print_round_total 

      player_1.get_winner(player_2)
      render
      
    end  
  end

end

#game = Game.new
#game.play