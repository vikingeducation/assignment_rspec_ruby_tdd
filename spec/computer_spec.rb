# rpsec/computer_spec.rb

require 'player'
require 'computer'

describe Computer do
  let(:computer){Computer.new}

  describe '#initialize' do
    it 'creates a player of type player' do
      expect(Computer.new).to be_a Computer
    end

    it 'Computer is also of type player' do
      expect(Computer.new).to be_a Player
    end

    it 'it raises an error if a player is initialized with a parameter' do
      expect{(Computer.new("Me"))}.to raise_error(ArgumentError)
    end
  end

end