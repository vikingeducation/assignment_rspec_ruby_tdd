require "board"

describe Board do
  context "#initialize" do

    it "should be a Board" do
      expect(subject).to be_a(Board)
    end
  end

  context "#check_victory" do

    it "should call #tie?" do
      expect(subject).to receive(:tie?)
      subject.check_victory(10, 10)
    end

    it "should call #win? if no tie" do
      expect(subject).to receive(:win?)
      subject.check_victory(10,5)
    end

    it "should not call #win? if there is a tie" do
      expect(subject).to_not receive(:win?)
      subject.check_victory(10,10)
    end

    it "should not add 1 to player score if tie" do
      subject.check_victory(10,10)
      expect(subject.instance_variable_get(:@score_player)).to eq(0)
    end

    context "Player Win" do
      it "should add 1 to player score if win" do
        subject.check_victory(10,5)
        expect(subject.instance_variable_get(:@score_player)).to eq(1)
      end

      it "should not add 1 to computer score if player win" do
        subject.check_victory(10,5)
        expect(subject.instance_variable_get(:@score_computer)).to eq(0)
      end
    end

    context "Player Loose" do
      it "should add 1 to computer score if win" do
        subject.check_victory(10,15)
        expect(subject.instance_variable_get(:@score_computer)).to eq(1)
      end

      it "should not add 1 to player score if computer win" do
        subject.check_victory(10,15)
        expect(subject.instance_variable_get(:@score_player)).to eq(0)
      end
    end
  end

  context "#tie?" do

    it "should return true if there is a tie" do
      expect(subject.tie?(10,10)).to eq true
    end

    it "should not return true if there is not a tie" do
      expect(subject.tie?(20,10)).to_not eq true
    end
  end

  context "#win?" do

    it "should return true if there is a win" do
      expect(subject.win?(20,10)).to eq true
    end

    it "should not return true if there is not a win" do
      expect(subject.win?(20,30)).to_not eq true
    end
  end

end