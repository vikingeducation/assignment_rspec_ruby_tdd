class Player
  attr_reader :score

  attr_accessor :last_roll

  def initialize(dice: Dice.new, game: nil)
    @dice = dice
    @game = game
    @score = 0
    @last_roll = nil
  end

  def ask_for_number
    @game.last_player_number
  end

  def score!
    @score += 1
  end

  def half_score!
    @score += 0.5
  end

  def roll
    @last_roll = @dice.roll(ask_for_number)
  end
end
