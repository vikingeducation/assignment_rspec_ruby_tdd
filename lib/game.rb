require_relative 'dice'
require_relative 'player'
class Game
  def initialize
    @player1 = Player.new
    @conrad = Player.new
  end

  def play
    info
    loop do #main
        number_of_dice = number
        valid_input(number_of_dice)
      @player1.turn(number_of_dice)
      @conrad.turn(number_of_dice)
      render(@player1.round_total, @conrad.round_total)
      if stop?
        break
      end
    end #main
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
  end

  def valid_input(number_of_dice)
    if number_of_dice.is_a?Integer
      return true
    else
      number_of_dice = number
    end
  end

  def render(player1_stat, conrad_stat)
    puts "Score:"
    puts "Player 1: #{player1_stat}"
    puts "Conrad:   #{conrad_stat}"
  end #end render

  def stop
    return true
  end

end #end Game

# game = Game.new
# game.play
