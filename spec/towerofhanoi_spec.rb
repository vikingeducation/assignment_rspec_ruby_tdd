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


  describe "#get_move" do
    let(:t) { TowerOfHanoi.new(3) }
    let(:@player) { Player.new }

    it "calls #input_move on player" do
      #player = double("player")
      allow(@player).to receive(:input_move).and_return(true)
      expect(t.get_move).to eq(:input_move)
    end

  end

end