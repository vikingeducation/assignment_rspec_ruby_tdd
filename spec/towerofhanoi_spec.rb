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

    it "should take a turn" do
      expect(game).to receive(:get_move).and_return([0,1])
      game.play
    end

  end


  describe "#get_move" do

    it "calls #input_move on player"

  end

end