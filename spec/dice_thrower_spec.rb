require_relative '../lib/dice_thrower'

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



RSpec.describe DiceThrower do
  let(:ui_spy) { spy('UI Spy') }
  let(:score_keeper_spy) { spy('Score Keeper') }
  let(:game) { DiceThrower.new(ui: ui_spy, scorer: score_keeper_spy) }

  before do
    allow(ui_spy).to receive(:prompt_player).and_return('3', 'q')
  end

  describe '#throw' do
    before do
      allow(game).to receive :show_score
      allow(game).to receive :roll_dice
      allow(game).to receive :total
      game.throw
    end

    it 'starts the game' do
      expect(ui_spy).to have_received(:welcome)
      expect(ui_spy).to have_received(:instructions)
    end

    it 'shows the score' do
      expect(game).to have_received(:show_score).twice
    end

    it 'prompts player for number of dice to throw' do
      expect(ui_spy).to have_received(:prompt_player).twice
    end

    it 'rolls the dice for human and computer' do
      expect(game).to have_received(:roll_dice).twice
    end

    it 'sums each player\'s rolls' do
      expect(game).to have_received(:total).twice
    end

    it 'determins winner' do
      expect(score_keeper_spy).to have_received(:determine_winner)
    end
  end

  describe '#total' do
    context 'given an array of rolls' do
      it 'returns the sum' do
        rolls = [3, 5, 1, 6, 3]
        expect(game.total(rolls)).to eq 18
      end
    end
  end

  describe '#roll_dice' do
    let(:num_dice) {3}

    it 'rolls number of dice passed to it' do
      expect(game.roll_dice(num_dice).length).to eq num_dice
    end

    it 'rolls number between 1 and 6 for each die' do
      rolls = game.roll_dice(num_dice)

      rolls.each do |roll|
        expect((1..6)).to cover roll
      end
    end
  end
end
