require_relative './dice_ui'
require_relative './score_keeper'

class DiceThrower
  attr_reader :ui

  def initialize(ui:, scorer:)
    @ui = ui
    @score_keeper = scorer
    @human_wins = 0
    @computer_wins = 0
  end

  def throw
    ui.welcome
    ui.instructions

    loop do
      show_score
      num_dice = ui.prompt_player
      break if num_dice.casecmp('q') > -1

      human_rolls = roll_dice(num_dice.to_i)
      computer_rolls = roll_dice(num_dice.to_i)

      human_total = total(human_rolls)
      computer_total = total(computer_rolls)

      @score_keeper.determine_winner(human_total, computer_total)
    end
  end

  def roll_dice(num_dice)
    Array.new(num_dice) { rand(1..6) }
  end

  def show_score
    ui.show_score(@score_keeper.human_wins, @score_keeper.computer_wins)
  end

  def total(rolls)
    rolls.inject(:+)
  end
end

dt = DiceThrower.new(ui: DiceUI.new, scorer: ScoreKeeper.new)
dt.throw