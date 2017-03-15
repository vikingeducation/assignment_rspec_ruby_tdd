require "anagrams"

describe "anagrams" do
  it "should not raise an error if the first argument is a string and the second argument is an array of words" do 
    expect{anagrams("looter", %w(random array of words))}.not_to raise_error(ArgumentError)
  end

  it "should raise an error when there are no arguments passed" do 
    expect{anagrams}.to raise_error(ArgumentError)
  end

  it "should raise an error when the 1st argument is not a string" do 
    expect{anagrams(1, %w(random array of words))}.to raise_error(ArgumentError)
  end

  it "should raise an error when the 2nd argument is not an array" do 
    expect{anagrams("looter", "I am not a looter")}.to raise_error(ArgumentError)
  end

  it "should raise an error if the 1st argument consists of more than one word" do 
    expect{anagrams("bad looter", %w(random words))}.to raise_error(ArgumentError)
  end

  it "should return an array of words that is included in the dictionary" do 
    expect(anagrams("looter", %w(spooky retool rootle tooler toddler))).to eq(%w(retool rootle tooler))
  end

  it "should return an empty array if no words are found in the dictionary" do 
    expect(anagrams("hi", %w("random words"))).to eq([])
  end

end