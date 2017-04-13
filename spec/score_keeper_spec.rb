RSpec.describe ScoreKeeper do
  describe 'determining who wins' do
    let(:score_keeper) { ScoreKeeper.new }

    it 'starts with human and computer scores at zero' do
      expect(score_keeper.human_wins).to eq 0
      expect(score_keeper.computer_wins).to eq 0
    end
    context 'human has high roll' do
      it 'gives human a point' do
        human = 17
        computer = 9
        expect { score_keeper.determine_winner(human, computer) }
          .to change { score_keeper.human_wins }.by 1
      end
    end

    context 'computer has high roll' do
      it 'gives human a point' do
        computer = 17
        human = 9
        expect { score_keeper.determine_winner(human, computer) }
          .to change { score_keeper.computer_wins }.by 1
      end
    end
  end
end