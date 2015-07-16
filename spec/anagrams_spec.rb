require 'anagrams'

describe "anagrams method" do
  let(:dictionary) { ["retool\n", "rootle\n", "tooler\n", "anchor\n", 
                      "shrubs\n", "looter\n"] }
  
  it "requires a string for input" do
    expect{ anagrams(1337) }.to raise_error(ArgumentError)
  end

  it "requires a single word for input" do
    expect{ anagrams("Bill Shakespeare") }.to raise_error(ArgumentError)
  end

  it "loads a dictionary" do
    expect( IO ).to receive(:read).with("dict.txt").and_return(dictionary)
    anagrams("test")

    # dictionary = ["blah\n", "blah\n", "blah\n"]
    # expect( IO ).to receive(:read).with("dict.txt").and_return(dictionary)
    # anagrams("test")
  end

  it "returns an array of anagrams" do
    allow( IO ).to receive(:read).with("dict.txt").and_return(dictionary)
    expect( anagrams("looter") ).to match_array( ["retool", "rootle", "tooler"] )
  end

  it "returns an empty array if there are no anagrams" do
    allow( IO ).to receive(:read).with("dict.txt").and_return(dictionary)
    expect( anagrams("zygote") ).to eq([])
  end
end