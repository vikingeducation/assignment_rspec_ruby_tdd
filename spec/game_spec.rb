require 'game'

describe Game do
  context "#play" do
    before(:each) do
      allow_any_instance_of(Human).to receive(:get_input).and_return(5)
    end

    it "should call #instruction" do
      expect(subject).to receive(:instruction)
      subject.play
    end

    it "should call #get_input on Human" do

      expect_any_instance_of(Human).to receive(:get_input)
      subject.play
    end

    it "should call #roll_dice with an argument on Human" do
      expect_any_instance_of(Human).to receive(:roll_dice).and_return(15)
      subject.play
    end

    it "should call #roll_dice with an argument on Computer" do
      expect_any_instance_of(Computer).to receive(:roll_dice).and_return(15)
      subject.play
    end

    it "should call Board to print The choices" do
      expect_any_instance_of(Board).to receive(:print_choices)
      subject.play
    end

    it "should call #check_victory with the two result on Board" do
      expect_any_instance_of(Board).to receive(:check_victory)
      subject.play
    end

    it "should call #render on Board" do
      expect_any_instance_of(Board).to receive(:render)
      subject.play
    end
  end
end