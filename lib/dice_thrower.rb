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
  def initialize(name = "Emily")
    # @player = Player.new(name)
    # @computer = Computer.new
  end
end
