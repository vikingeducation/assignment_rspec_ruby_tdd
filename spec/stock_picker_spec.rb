require "stock_picker"

describe "stock_picker" do
  it "should raise an argument error when there are no arguments passed" do 
    expect{stock_picker}.to raise_error(ArgumentError)
  end
  it "should raise an argument error when argument is not an array" do 
    expect{stock_picker("random string")}.to raise_error(ArgumentError)
  end 

  it "must analyze an array of stock prices of 2 days or more" do 
    expect{stock_picker([35])}.to raise_error(ArgumentError)
  end

  it "requires an array that consists of all integers" do 
    expect{stock_picker([1, 2, "non-number"])}.to raise_error(ArgumentError)
  end

  it "must accept floats in the array" do 
    expect{stock_picker([12.3, 20, 12.3])}.not_to raise_error(ArgumentError)
  end

  it "must not have any negative stock prices in the array" do 
    expect{stock_picker([20, 30, -10])}.to raise_error(ArgumentError)
  end

  it "should not raise an error if the correct number of elements are in the array" do 
    expect{stock_picker([1, 2])}.not_to raise_error(ArgumentError)
  end

  it "should have an array that contains at least one profitable pair of days" do 
    expect{stock_picker([35, 20, 15])}.to output("No profits to be made!\n").to_stdout
  end

  it "should return nil if there are no profitable days" do 
    expect(stock_picker([20, 15, 12])).to eq(nil)
  end

  it "should return the index bought that resulted in the most profitable trade" do 
    expect(stock_picker([25, 40, 50])[0]).to eq(0)
  end

  it "should return the index sold that resulted in the most profitable trade" do 
    expect(stock_picker([25, 40, 50])[1]).to eq(2)
  end 

  it "should return an array of the buy and sell index that resulted in the most profitable trade" do 
    expect(stock_picker([25 ,40, 50])).to eq([0, 2])
  end

  it "should return the correct buy and sell indexes with only two stock prices" do 
    expect(stock_picker([25, 50])).to eq([0, 1])
  end

  it "should return the correct buy and sell indexes with many stock prices" do 
    expect(stock_picker([44, 30, 24, 32, 35, 30, 40, 38, 15])).to eq([2, 6])
  end 

end





