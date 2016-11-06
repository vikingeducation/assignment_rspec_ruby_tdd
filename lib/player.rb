class Player
  attr_accessor :score
  attr_reader :wins
  def initialize
    @score = 0
    @wins = 0
  end

  def won
    @wins += 1
  end
end