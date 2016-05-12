require_relative '../lib/anagrams'

describe "Anagrams" do

  it "passes valid arguments" do
    expect { anagrams("banana", ["fruit", "tropical"]) }.not_to raise_error
  end

  it "raises error for invalid arguments" do
    expect { anagrams("banana", [45, 34]) }.to raise_error(ArgumentError)
  end

  it "returns an array of anagrams if they exist" do
    expect(anagrams("looter", ["spooky", "retool", "rootle", "tooler", "toddler"])).to eq(["RETOOL", "ROOTLE", "TOOLER"])
  end

  it "returns an empty array if no anagrams exist" do
    expect(anagrams("zygot", ["spooky", "retool", "rootle", "tooler", "toddler"])).to eq([])
  end

end
