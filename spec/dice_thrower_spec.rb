require 'dice_thrower'

describe "DiceThrower"

  describe "#initialize" do
    it "creates a human player instance variable 'player'"
    it "creates a computer player instance variable 'computer'"
    it "creates a board instance variable"

  end

  describe '#play' do
    it 'loops until player wants to quit'
    it 'renders game board at beginning of each loop'
    it 'asks player continue/quit at end of each turn'
    it 'breaks when player chooses to quit'
    it 'displays game board once more after player quits'
    it 'displays game_over_message after player quits'

  end



  describe 'win?' do
    it 'returns who wins'
  end

end
