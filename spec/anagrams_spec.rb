require 'anagrams'

describe "anagrams" do
  let(:word){"looter"}
  let(:dict){%w{retool rootle tooler spooky}}

  it "returns anagrams of first input found in the second input" do
    expect(anagrams(word, dict)).to eq(["retool", "rootle", "tooler"])
  end

  it "returns a blank array if no anagrams are found" do
    expect(anagrams("zebra", dict)).to eq([])
  end

  it "throws an error if second input is not an array" do
    expect{anagrams(word)}.to raise_error(ArgumentError)
  end

  it "throws an error if the first input is not a string" do
    expect{anagrams(30,dict)}.to raise_error(ArgumentError)
  end

  it "throws an error if second input has less than one element" do
    expect{anagrams(word,[])}.to raise_error(ArgumentError)
  end
  it "throws an error if the first input is blank" do
    expect{anagrams("",dict)}.to raise_error(ArgumentError)
  end
end
