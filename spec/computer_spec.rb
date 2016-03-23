require 'computer'

describe Computer do
  context "#roll_dice" do
    it "should return a random number between 1 and 6" do
      expect(1..6).to cover(subject.roll_dice)
    end

    it 'should roll the number of dice pass as argument' do
      expect(subject.roll_dice(7)).to be >= 7
    end 
  end
end