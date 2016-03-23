require 'human'

describe Human do
  context "#get_input" do
    it "shoud call #gets" do
      expect(subject).to receive(:gets).and_return("5")
      subject.get_input
    end

    it "should return a valid number" do
      allow(subject).to receive(:gets).and_return("5")
      expect(subject.get_input).to eq(5)
    end

    it "should loop until a valid input" do
      allow(subject).to receive(:gets).and_return("-5","-3", "5")
      expect(subject.get_input).to eq(5)
    end
  end

  context "#roll_dice" do
    it "should return a random number between 1 and 6" do
      expect(1..6).to cover(subject.roll_dice)
    end

    it 'should roll the number of dice pass as argument' do
      expect(subject.roll_dice(7)).to be >= 7
    end 
  end
end