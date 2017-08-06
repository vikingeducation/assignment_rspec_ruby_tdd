RSpec.describe DiceThrower::Score do
  describe '#initialize' do
    it 'adds two players its player hash' do
      player1 = instance_double('DiceThrower::Human')
      player2 = instance_double('DiceThrower::Computer')
      score = DiceThrower::Score.new(player1, player2)
      expect(score.players.keys).to include(player1, player2)
    end
  end

  describe '#update' do
    context 'with a winner' do
      it 'updates the score' do
        player1 = instance_double('DiceThrower::Human', dices_rolled: [4, 6, 3])
        player2 = instance_double('DiceThrower::Computer', dices_rolled: [2, 1, 2])
        score = DiceThrower::Score.new(player1, player2)

        expect { score.update }.to change { score.players }.
          from({player1 => 0, player2 => 0}).to({player1 => 1, player2 => 0})
      end
    end

    context 'when tie' do
      it 'does not update the score' do
        player1 = instance_double('DiceThrower::Human', dices_rolled: [4, 6, 3])
        player2 = instance_double('DiceThrower::Computer', dices_rolled: [4, 6, 3])
        score = DiceThrower::Score.new(player1, player2)

        expect { score.update }.not_to change { score.players }
      end
    end
  end

  describe 'to_s' do
    it 'formats the score of each player' do
      player1 = instance_double('DiceThrower::Human', dices_rolled: [4, 6, 3], name: 'Jacob')
      player2 = instance_double('DiceThrower::Computer', dices_rolled: [2, 1, 2], name: 'RW4576')
      score = DiceThrower::Score.new(player1, player2)
      score.update

      string = "***** SCORE *****\nJacob:  1 wins\nRW4576:  0 wins\n*****************"
      expect(score.to_s).to eq string
    end
  end
end
