require_relative 'dice'
require_relative 'player'
class Game
  def initialize
    @player1 = Player.new
    @conrad = Player.new
  end

  def play

    
    info
    stop = false
    until stop do #main
      number_of_dice = number
      valid_input(number_of_dice)
      @player1.turn(number_of_dice)
      @conrad.turn(number_of_dice)
      render(@player1.round_total, @conrad.round_total)
      stop = ask_to_quit
    end #main
    final_display
  end #end play

  private
  def info
    puts "Welcome to Dice Thrower"
    puts "Instructions"
    puts "If your total is higher than the computer, you win!"
  end #end info

  def number
    puts "Enter how many dice you'd like to throw."
    number_of_dice = gets.chomp.to_i
    return number_of_dice
  end #end number

  def valid_input(number_of_dice)
    if number_of_dice.is_a?Integer
      return true
    else
      number_of_dice = number
    end
  end # end valid_input

  def render(player1_stat, conrad_stat)
    puts "Score:"
    puts "Player:  #{player1_stat}"
    puts "Conrad:  #{conrad_stat}"
  end #end render

  def ask_to_quit
    puts "Press 'q' to quit or any other key to keep playing"
    answer = gets.chomp
   return answer == "q"
  end

  def final_display
    puts "Here is your running total score:"
    render(@player1.running_total, @conrad.running_total)
    puts "Thanks for playing."
  end

end #end Game

# game = Game.new
# game.play
