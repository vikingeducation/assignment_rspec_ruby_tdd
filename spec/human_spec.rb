require 'human'
require 'dice_thrower'

describe Human do
  let(:game_double) { instance_double("DiceThrower", :last_player_number= => nil) }
  let(:human) { Human.new(game: game_double) }

  describe '#ask_for_number' do

     it 'returns a number from the player' do
       allow(human).to receive(:gets).and_return('5')
       expect(human.ask_for_number).to eq 5
     end

     it 'quit the game if the human enters quit' do
       allow(human).to receive(:gets).and_return('quit')
       expect(game_double).to receive(:quit!)
       human.ask_for_number
     end

     it 'asks until the number is between 1 and 6' do
       allow(human).to receive(:gets).and_return('0', '-4', '8', '6')
       expect(human.ask_for_number).to eq 6
     end

     it 'should send its number to the game' do
       allow(human).to receive(:gets).and_return('6')
       expect(game_double).to receive(:last_player_number=).with(6)
      human.ask_for_number
     end
  end
end
