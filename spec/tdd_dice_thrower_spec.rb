require "tdd_dice_thrower"

describe DiceThrower do
  let(:dt){ DiceThrower.new }

  describe "new game" do
    it "outputs the instructions" do
      allow(dt).to receive(:game_loop).and_return(nil)
      expect{dt.play}.to output(/Instructions:/).to_stdout
    end
  end

  describe "#score" do
    it "is empty in the beginning of the game" do
      expect(dt.score).to eq({p1: 0, p2: 0})
    end
  end

  describe "#print_score" do
    it "outputs the current score" do
      expect{dt.print_score}.to output(/SCORE/).to_stdout
    end

    it "outputs 0 if the game just started" do
      expect{dt.print_score}.to output(/p1: 0 wins/).to_stdout
    end
  end

  describe "#prompt_input" do
    it "prints a text prompt the user's input" do
      allow(dt).to receive(:gets).and_return("5")
      expect{dt.prompt_input}.to output(
      "\nEnter number of dice to throw > ").to_stdout
    end

    it "keeps prompting for input while it's not valid" do
      allow(dt).to receive(:gets).and_return("not valid", "5")
      expect{dt.prompt_input}.to output(/Enter a valid number/).to_stdout
    end

    it "accepts 'q' as its argument, returning it" do
      allow(dt).to receive(:gets).and_return("q")
      expect(dt.prompt_input).to be(false)
    end

    it "returns the user's input sanitized" do
      allow(dt).to receive(:gets).and_return("5", "q")
      expect(dt.prompt_input).to eq(5)
    end
  end

  describe "#roll_dice" do
    it "returns the sum of the results of rolling the dice n times" do
      result = dt.roll_dice(5)
      expect(result).to be >= 5
    end
  end

end
