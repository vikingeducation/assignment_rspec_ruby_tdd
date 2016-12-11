require 'anagrams'

describe 'anagrams' do

  it "raises an error if a string is not passed in" do
    expect{anagrams(["dictionary"])}.to raise_error(ArgumentError)
  end

  it "raises an error if dictionary array is not passed in" do
    expect{anagrams("string")}.to raise_error(ArgumentError)
  end

  it "raises an error if input contains more than one word" do
    expect{anagrams("st ring", ["string"])}.to raise_error("Please submit only one word.")
  end

  it "accepts a string and dictionary array without error" do
    expect{anagrams("string", ["dictionary"])}.not_to raise_error
  end

  it "returns array of anagrams from given string" do
    expect(anagrams("looter", %w(spooky retool rootle tooler toddler))).to eq(["retool", "rootle", "tooler"])
  end
end