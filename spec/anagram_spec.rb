require 'anagram'

describe '#anagram' do
  before(:each) do
    allow(File).to receive(:open).and_return(["LOOTER", "RETOOL", "ROOTLE", "TOOLER", "LIFE"])
  end

  it "should take a one-word string input" do
    expect{anagram('LOOTER')}.not_to raise_error
  end

  it "should accept lower-case words" do
    expect(anagram('Looter')).to eq(anagram('LOOTER'))
  end

  it "should only use the first word given" do
    expect(anagram('LOOTER FILE')).to eq(anagram('LOOTER'))
  end

  it "should load the dictionary" do
    expect(File).to receive(:open)
    anagram("LOOTER")
  end

  context 'return' do
    it "should return an array of anagrams if there are any" do
      expect(anagram("LOOTER")).to include("RETOOL")
    end

    it "should not return the original word" do
      expect(anagram("LOOTER")).not_to include("LOOTER")
    end

    it "should return an exhaustive list" do
      expect(anagram("LOOTER")).to eq(["RETOOL", "ROOTLE", "TOOLER"])
    end

    it "should return an empty array if there are no anagrams" do
      expect(anagram("SUPERFLUOUS")).to eq([])
    end
  end
end