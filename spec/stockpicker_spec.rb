require 'stockpicker'

describe "stockpicker method" do
  it "requires an array" do
    expect{ stockpicker(Hash.new) }.to raise_error(ArgumentError)
  end

  it "requires an array with at least 3 items" do
    expect{ stockpicker([1, 2]) }.to raise_error(ArgumentError)
  end
  it "requires an array comprised solely of integers" do
    expect{ stockpicker([1, 2, "c"]) }.to raise_error(ArgumentError)
  end

  context "returns the two days with the largest difference between them" do

    it "but only if the lesser of the two days' prices comes before" do
      expect( stockpicker([23, 42, 90, 48, 5, 110, 15]) ).to eq([4, 5])
    end

    it "and not if the lesser of the two comes after" do
      expect( stockpicker([23, 42, 90, 48, 110, 5, 15]) ).to eq([0, 4])
    end
    
  end
  
end