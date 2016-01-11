require 'anagrams'

dictionary = ["RETOOL", "ROOTLE", "TOOLER", "LOOTER", "PEARS", "PARES", "MOM"]

describe "#anagrams" do
  it "throws ArgumentError if input is empty string" do
    expect{anagrams("", dictionary)}.to raise_error(ArgumentError)
  end

  it "throws ArgumentError if input is not a string" do
    expect{anagrams(0, dictionary)}.to raise_error(ArgumentError)
  end

  it "throws ArgumentError if dictionary is not an array" do
    expect{anagrams("retool", 0)}.to raise_error(ArgumentError)
  end

  it "returns anagram list for pears" do
    expect(anagrams("pears", dictionary)).to eq(["PARES"])
  end

  it "returns anagram list for retool" do
    expect(anagrams("retool", dictionary)).to eq(["ROOTLE", "TOOLER", "LOOTER"])
  end

  it "doesn't return self as anagram if it is a palindrome" do
    expect(anagrams("mom", dictionary)).to eq([])
  end

  it "returns empty if there are no anagrams in dictionary" do
    expect(anagrams("zygote", dictionary)).to eq([])
  end

end