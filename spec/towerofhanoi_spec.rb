require "towerofhanoi"

describe TowerOfHanoi do

  describe "#initialize" do

    it "raises an error if the argument is less than 3" do
      expect { TowerOfHanoi.new(2) }.to raise_error
    end


    #it "creates a board" do
    #  t = TowerOfHanoi.new
    #  expect(t.board).not_to be_nil
    #  receive(:new).with(3)
    #end

    #it "passes number of discs to the board"

  end



  describe "#play" do
    let(:game) { TowerOfHanoi.new(3) }

    #it "should take a turn with a valid move" do
    #  expect(game).to receive(:get_move).and_return([1,2])
      #game.play
    #end

  end


  describe "#get_move" do

    #it "prompts player for input"

    #it "calls #validate_move on the input"

    #it "passes the move to the board"

  end


  describe "#validate_move" do
    let(:game) { TowerOfHanoi.new(3) }

    it "rejects non-string input" do
      expect{ game.validate_move([1,3]) }.to raise_error
    end

    it "accepts valid input" do
      expect{ game.validate_move("1,3") }.not_to raise_error
    end

    it "handles extra spaces around numbers and comma" do
      expect{ game.validate_move(" 1 ,  3 ") }.not_to raise_error
    end

    #it "processes move if valid" do
    #  expect{ game.validate_move("1,3") }.to output([1,3]).to_stdout
    #end

    it "asks for a new input if out of range" do
      expect(game).to receive(:get_move)
      game.validate_move("1,5")
    end

    it "asks for new input if multiple commas" do
      expect(game).to receive(:get_move)
      game.validate_move("1,2,3")
    end

  end

end