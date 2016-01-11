require 'player'
require 'computer'

describe Computer do

  let( :computer ){ Computer.new }

  describe '#set_dice' do
    it 'raises ArgumentError if parameter not passed' do
      expect{computer.set_dice}.to raise_error(ArgumentError)
    end

    it 'raises TypeError if parameter is not a Player' do
      expect{computer.set_dice("string")}.to raise_error(TypeError)
    end
  end
end