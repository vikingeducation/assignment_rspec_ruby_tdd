require 'computer'
require 'spec_helper'

describe Computer do
  let(:game_double) { "game"}
  let(:computer) { Computer.new(game_double) }

  describe '#ask_for_number' do
    it "should retrieve a number from the game" do
      expect(game_double).to receive(:last_player_number)
      computer.ask_for_number
    end
  end
end
