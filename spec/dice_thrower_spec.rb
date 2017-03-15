require "dice_thrower"

describe DiceThrower do 

  let(:game){ DiceThrower.new }
  let(:player){ game.instance_variable_get(:@player) }
  let(:comp){ game.instance_variable_get(:@computer) }

  describe "#initialize" do 
    it "creates a new player saved to an instance variable" do 
      expect(player).to be_an_instance_of(Player)
    end

    it "creates a new computer saved to an instance variable" do 
      expect(comp).to be_an_instance_of(Computer)
    end
  end

  describe "#who_won" do 
    it "determines the winner based on who rolled the higher number" do 
      fake_player = double(:roll => 5)
      fake_computer = double(:roll => 2)
      expect(game.who_won(fake_player.roll, fake_computer.roll)).to eq(player)
    end

    it "results in the computer winning if the computer rolls a higher number" do 
      fake_player = double(:roll => 2)
      fake_computer = double(:roll => 5)
      expect(game.who_won(fake_player.roll, fake_computer.roll)).to eq(comp)
    end

    it "doesn't return a winner if there is a tie" do 
      fake_player = double(:roll => 3)
      fake_computer = double(:roll => 3)
      expect(game.who_won(fake_player.roll, fake_computer.roll)).to eq(nil)
    end
  end

  describe "#score" do 
    before do 
      allow(player.instance_variable_set(:@dice_number, 1))
      allow(game).to receive(:who_won).and_return(player)
    end

    it "should add 1 to the winner's score" do 
      game.score
      expect(game.instance_variable_get(:@player_score)).to eq(1)
    end

    it "should add 2 to the winner's score if winner wins twice" do 
      2.times { game.score }
      expect(game.instance_variable_get(:@player_score)).to eq(2)
    end
  end

  describe "#quit?" do 
    it "returns true if user inputs 'q'" do 
      allow(game).to receive(:gets).and_return("q")
      expect(game.quit?).to be true
    end

    it "returns false if user inputs anything other than 'q'" do 
      allow(game).to receive(:gets).and_return("n")
      expect(game.quit?).to be false
    end
  end

  describe "#trigger_roll" do 
    it "should return true if user presses any key" do 
      allow(game).to receive(:gets).and_return("l")
      expect(game.trigger_roll).to be true
    end
  end

end
