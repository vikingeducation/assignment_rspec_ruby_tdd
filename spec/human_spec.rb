require 'human'
require 'spec_helper'

describe Human do
  let(:human) { Human.new }

  describe '#ask_for_number' do

     it 'returns a number from the player' do
       allow(human).to receive(:gets).and_return('5')
       expect(human.ask_for_number).to eq 5
     end

     it 'returns false if the human enters quit' do
       allow(human).to receive(:gets).and_return('quit')
       expect(human.ask_for_number).to eq false
     end

     it 'asks until the number is between 1 and 6' do
       allow(human).to receive(:gets).and_return('0', '-4', '8', '6')
       expect(human.ask_for_number).to eq 6
     end
  end
end
