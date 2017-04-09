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
