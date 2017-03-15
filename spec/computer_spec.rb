require "computer"

describe Computer do 

  let(:comp){ Computer.new }

  describe "#roll" do 
    it "should return a random based on the number of dice player chooses" do 
      fake_number = double(:dice_num => 1)
      expect(comp.roll(fake_number.dice_num)).to be_within(5).of(1)
    end

    it "should raise an argument error if no arguments are passed" do 
      expect{comp.roll}.to raise_error(ArgumentError)
    end
  end

end