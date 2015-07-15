require 'anagrams'

describe "anagrams method" do
  #let(:dict) { double("IO", :read => ["blah", "blah", "blah"]) }
  
  it "requires a string for input" do
    expect{ anagrams(1337) }.to raise_error(ArgumentError)
  end

  it "should load a dictionary" do
    #allow(IO).to receive(:read).with("dict.txt").and_return(["blah\n", "blah\n", "blah\n"])
    expect( anagrams("words") ).to eq("whatever")
  end
end