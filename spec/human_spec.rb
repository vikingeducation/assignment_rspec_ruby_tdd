# rpsec/human_spec.rb

require 'player'
require 'human'

describe Human do
  let(:human){Human.new}

  describe '#initialize' do
    it 'creates a human of type Human' do
      expect(Human.new).to be_a Human
    end

    it 'Human is also of type player' do
      expect(Human.new).to be_a Player
    end

    it 'it raises an error if a human is initialized with a parameter' do
      expect{(Human.new("Me"))}.to raise_error(ArgumentError)
    end
  end

end