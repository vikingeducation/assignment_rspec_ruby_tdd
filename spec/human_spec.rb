require './lib/dice_thrower/human.rb'


describe Human do

  let (:human) { Human.new }


  describe '#initialize' do

    it "human player has nil dice" do
      expect(human.dice.nil?).to be true
    end

  end


  describe "#user_input" do

    it "returns valid input as an integer" do
      allow(human).to receive(:gets).and_return("10")
      expect(human.user_input).to eq(10)
    end

    it "prompts the user for another input when the first one is invalid" do
      allow(human).to receive(:gets).and_return("fake", "3")
      expect(human.user_input).to eq(3)
    end

  end



end