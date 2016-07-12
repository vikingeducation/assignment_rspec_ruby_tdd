require 'player'

class DiceThrower
  def initialize(human = nil, computer = nil, dice = nil)
    @human = human
    @computer = computer
    @human ||= Human.new
    @computer ||= Player.new
  end

  def play

    loop do
      num_dice = @human.get_number_of_dice
      @human.create_dice(num_dice)
      @computer.create_dice(num_dice)

      @human.roll
      @computer.roll

      winner = compare_scores

      if winner == @computer
        @computer.win
      else
        @human.win
      end

      display_scores
      break if @human.quit?
    end
  end

  def compare_scores
    @human
  end

  def display_scores

  end
end