require 'game'

describe Game do
  it 'is a game' do
    expect(subject).to be_a(Game)
  end

  let(:game) { Game.new }

  describe '#initialize' do
    it 'builds a human player' do
      expect(game.instance_variable_get(:@player_1).name).to eq("1")
    end
    it 'build a computer player' do
      expect(game.instance_variable_get(:@player_2).name).to eq("2")
    end
  end

  describe '#play' do
    before(:each) do
      allow(game).to receive(:print_current_score).and_return(nil)
      allow(game).to receive(:print_victory).and_return(nil)
    end

    it 'runs print_intro' do
      allow(game).to receive(:ask_for_throws).and_return("q")
      allow(game).to receive(:compute_rolls).and_return(nil)
      expect(game).to receive(:print_intro).and_return("1")
      game.play
    end

    before(:each) { allow(game).to receive(:print_intro).and_return(nil) }

    it 'runs ask_for_throws' do
      allow(game).to receive(:ask_for_throws).and_return("q")
      expect(game).to receive(:ask_for_throws)
      game.play
    end

    before(:each) { allow(game).to receive(:ask_for_throws).and_return(1, "q") }
    it 'runs compute_rolls' do
      allow(game).to receive(:ask_for_throws).and_return("1", "q")
      expect(game).to receive(:compute_rolls)
      game.play
    end

    it 'runs print_current_score' do
      expect(game).to receive(:print_current_score)
      game.play
    end

    it 'runs print_victory' do
      expect(game).to receive(:print_victory)
      game.play
    end


  end
end
