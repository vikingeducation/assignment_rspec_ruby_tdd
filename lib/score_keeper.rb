class ScoreKeeper
  attr_reader :human_wins, :computer_wins

  def initialize
    @human_wins = 0
    @computer_wins = 0
  end

  def determine_winner(human_roll, computer_roll)
    return if human_roll == computer_roll
    human_roll > computer_roll ? @human_wins += 1 : @computer_wins += 1
  end
end