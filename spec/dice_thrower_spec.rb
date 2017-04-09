require 'dice_thrower'
require 'spec_helper'

describe DiceThrower do
	let(:dice) {DiceThrower.new}

  describe "#roll" do 
  	it "should return random number from 1-6" do 
  	expect(dice.roll).to be_between(1,6)
    end
  end

end

