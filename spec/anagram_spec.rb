require 'anagram'

describe '#anagram' do
  before(:each) do
    allow(File).to receive(:open).and_return(["LOOTER", "RETOOL", "ROOTLE", "TOOLER", "LIFE"])
  end

  it "accepts a word" do
    expect{anagram('LOOTER')}.not_to raise_error
  end

  it "opens dictionary" do
    expect(File).to receive(:open)
    anagram("LOOTER")
  end

 it "does not include input value" do
    expect(anagram("LOOTER")).not_to include("LOOTER")
  end

  it "sends back anagrams" do
    expect(anagram("LOOTER")).to include("RETOOL")
  end

  it "sends back multiple words" do
    expect(anagram("LOOTER")).to eq(["RETOOL", "ROOTLE", "TOOLER"])
  end

  it "should return an empty array if there are no anagrams" do
    expect(anagram("SUPERFLUOUS")).to eq([])
  end

end
