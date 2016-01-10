require 'dice'
      
describe "Game" do 
  
  let(:dice){ Dice.new}

  describe "check that dice is initialized" do
    
    it "initializes the Dice object " do
        expect(dice).to be_an_instance_of(Dice)
    end 

    it "initializes number of dice to 0 " do
        expect(dice.num_dice).to eq(0)
    end 
  end

  describe "roll dice" do
    
    it "rolls 1 dice and pick a number between 1 and 6" do
        num = dice.roll_dice
        
        num = dice.roll_dice
        expect(1..6).to cover(num)

        num = dice.roll_dice
        expect(1..6).to cover(num)  
    end

  end

  describe "roll all dice" do
    
    it "rolls 3 dice and pick a number between 3 and 18" do
      dice.num_dice = 3
      expect(3..18).to cover(dice.roll_all_dice)
      expect(3..18).to cover(dice.roll_all_dice)
      expect(3..18).to cover(dice.roll_all_dice) 
    end

  end

  describe "check ask roll rice allows upto MAX dice to be rolled " do
    
    it "gets correct no of dice to roll from user and updates the dice_num" do
      allow(dice).to receive(:gets).and_return("1","4","10")
      allow(dice).to receive(:print)

      dice.ask_dice_roll
      expect(dice.num_dice).to eq(1)
      
      dice.ask_dice_roll
      expect(dice.num_dice).to eq(4)

      dice.ask_dice_roll
      expect(dice.num_dice).to eq(10)

    end

    it "asks loops for out of range value for dice roll" do
      allow(dice).to receive(:print)
      allow(dice).to receive(:gets).and_return("0","-1","11","1")
      
      dice.ask_dice_roll
      dice.ask_dice_roll
      dice.ask_dice_roll
      dice.ask_dice_roll
      
      expect(dice.num_dice).to eq(1)

    end

  end
end

      
