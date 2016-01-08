require 'dice'

class Player
  attr_reader :score

  def initialize(dice: Dice.new, game: nil)
    @dice = dice
    @game = game
    @score = 0
  end

  def ask_for_number
    @game.last_player_number
  end

  def score!
    @score += 1
  end

  def roll
    @dice.roll(ask_for_number)
  end
end
