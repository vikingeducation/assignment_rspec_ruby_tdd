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
  def initialize
    @player = Player.new
    @computer = Computer.new
  end

  def play
    loop do
      # dices = @player.input
      break
    end
    say_good_bye
  end

  #private method
  def say_good_bye
    puts "Bye bye ~~ We will missss you"
  end
end
