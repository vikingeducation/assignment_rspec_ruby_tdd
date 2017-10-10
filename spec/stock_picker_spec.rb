require 'stock_picker'

describe '#stock_picker' do
  let(:stock_prices) { [44, 30, 24, 32, 35, 30, 40, 38, 15] }
  let(:declining_prices) { [9, 8, 7, 6, 5, 4, 3, 2, 1] }

  subject { stock_picker(stock_prices) }

  it "raises an error if the input is not an array" do
    expect { stock_picker('this is a string') }.to raise_error(ArgumentError)
  end

  it "outputs an array of 2 days" do
    expect(subject.length).to eq(2)
  end

  it "the first number in the pair is the buy day (lower)" do
     expect(subject[0]).to be <= (subject[1])
  end

  context 'during a losing situation' do
    xit "raises a losing error" do
       expect(stock_picker(declining_prices)).to eq([1,1])
       # expect { stock_picker(declining_prices) }.to raise_error 'Losing situation'
    end
  end
end
