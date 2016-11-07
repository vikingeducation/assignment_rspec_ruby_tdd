require 'dice_thrower'

describe Game do 

  let(:game) { Game.new }

  describe '#initialize' do 

    it 'creates a human player' do
      expect(game.human).to_not be_nil
    end    

    it 'creates a computer player' do 
      expect(game.computer).to_not be_nil
    end

  end

  describe '#run' do 

    it 'displays the welcome message' do 
      expect(Render).to receive(:welcome)
      game.run
    end

    it 'displays the instructions' do 
      expect(Render).to receive(:instructions)
      game.run
    end

    it 'displays the score' do 
      expect(Render).to receive(:show_scores)
      game.run
    end

    it 'asks for the dice number' do 
      expect(Render).to receive(:enter_dice)
      game.run
    end

    it 'successfully gets the dice number' do 
      allow(game.human).to receive(:set_dice_num)
    end

  end

end

######################################

describe Human do 

  let(:human) { Human.new }

  describe '#set_dice_num' do 

    it "gets the number of dice from the player" do
      allow(human).to receive(:gets).and_return('3')
      expect(human.set_dice_num).to eq(3)
    end

    it 'raises an error if number of dice is less than 0' do 
      allow(human).to receive(:gets).and_return('-3')
      expect{human.set_dice_num}.to raise_error("Error: invalid input")
    end

    it 'raises an error if a single non-number char is inputted' do 
      allow(human).to receive(:gets).and_return('j')
      expect{human.set_dice_num}.to raise_error("Error: invalid input")
    end

  end

  describe '#roll_dice' do 

    it "allows the player to roll 3 dice" do 
      expect(human.roll_dice(3)).to be_within(7.5).of(10.5)
    end

    it "allows the player to roll 1 die" do 
      expect(human.roll_dice(1)).to be_within(2.5).of(3.5)
    end

  end

  describe '#update_score' do 

    it 'increases the score by 1' do 
      human.score = 0
      human.update_score
      expect(human.score).to eq(1)
    end

  end

end

######################################

describe Computer do 

  let(:computer) { Computer.new }

  describe '#roll_dice' do 

    it 'allows the computer to roll a number of dice' do 
      expect(computer.roll_dice(3)).to be_within(7.5).of(10.5)
    end

  end

  describe '#update_score' do 

    it 'increases the score by 1' do 
      computer.score = 0
      computer.update_score
      expect(computer.score).to eq(1)
    end

  end

end

######################################

describe Render do 

  describe "#welcome" do 

    it 'welcomes the player with a message' do 
      welcome_msg = "Welcome to Dice Thrower\n"
      expect{ Render.welcome }.to output(welcome_msg).to_stdout
    end

    it 'provides instructions to the player' do 
      instructions = "Instructions:\nEnter how many dice you'd like to throw\nIf your total is higher than the computer, you win!\nEnter \'q\' to quit.\n"
      expect{ Render.instructions }.to output(instructions).to_stdout
    end

    it 'outputs the score' do 
      score = "***** SCORE *****\nYou:\t0 wins\nClue:\t0 wins\n*****************\n"
      expect{ Render.show_scores(0, 0) }.to output(score).to_stdout
    end

    it 'asks the player to enter number of dice to throw' do
      enter_dice_msg = "Enter number of dice to throw:"
      expect{ Render.enter_dice }.to output(enter_dice_msg).to_stdout
    end

  end

end