require 'stockpicker'

describe 'stock_pick' do
  it "receive integers" do
    expect{stock_pick([1,2])}.not_to raise_error
  end

  it "raises error if not an integer input" do
    expect{stock_pick("q")}.to raise_error
  end

  it "refuses negative integers" do
    expect{stock_pick([-1, -8])}.to raise_error(ArgumentError)
  end

  it "has an array returned" do
    expect(stock_pick([4,5])).to be_a(Array)
  end

  it "yields maximum returns" do
    expect(stock_pick([1,2,3,1])).to eq([0,2])
  end
end
