require 'player'
require 'dice_thrower'
require 'spec_helper'

describe Player do
	let(:player) { Player.new }

	describe "#initialize" do 
   it 'creates a player of Player type' do 
   expect(player).to be_a(Player)
   end
  end

  describe "#ask_how_many_dice" do 
  	before do 
  	allow(player).to receive(:gets).and_return("3")
    end
  	it 'asks the player to input how many dice to throw' do 
  		expect(player.ask_how_many_dice).to eq(3)
  	end
  end

end
