require_relative '../lib/stock_picker'

describe "Stock Picker" do

  it "takes an array of numbers as an argument" do
    expect{ stock_picker([1,3])}.not_to raise_error
  end
end
