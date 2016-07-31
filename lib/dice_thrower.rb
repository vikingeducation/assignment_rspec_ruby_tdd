require 'player.rb'
require 'computer.rb'
=begin
class: DiceThrower
  main_action: play, show_result
  play: while true => player.input => break if input 'q' => player.throw_dice dices =>computer.throw_dice player.dices=> show_result

class: Player
  main_action: input, throw_dice dices

class: Computer
  main_action: throw_dice dices
=end

class DiceThrower
  def initialize(player: Player.new, computer: Computer.new)
    @player = player
    @computer = computer
  end

  def play
    loop do
      dices = @player.input
      break if dices == 'q'
      player_sum = @player.throw_dice dices
      computer_sum = @computer.throw_dice dices
      show_result player_sum, computer_sum
    end
    say_good_bye
  end

  def show_result player_sum, computer_sum
    result = player_sum <=> computer_sum
    case result
    when 1 then puts 'You win!'
    when -1 then puts 'Computer win!'
    when 0 then puts 'Even game, play again!'
    end
  end

  #private method
  def say_good_bye
    puts "Bye bye ~~ We will missss you"
  end
end
