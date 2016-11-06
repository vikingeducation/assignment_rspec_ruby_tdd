require 'rspec'
require 'anagram'

describe "#anagrams" do
  let(:dict) {%w(spooky retool rootle tooler toddler)}
  it "returns all anagrams of a given string in a dictionary" do
    expect(anagrams("looter", dict)).to eq (["RETOOL", "ROOTLE", "TOOLER"])
  end

  it "uses example.txt when not passed a dictionary" do
    allow(File).to receive(:foreach).and_return(dict)
    expect(anagrams("looter")).to eq (["RETOOL", "ROOTLE", "TOOLER"])
  end
end