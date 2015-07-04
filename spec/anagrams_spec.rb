require 'anagrams'


describe '#anagrams' do
  
  it "should raise an error if input is not string" do
    expect{anagrams(1)}.to raise_error
  end

  it "should accept a string" do
    expect{anagrams("hello")}.not_to raise_error
  end

  it "should raise an error if string contains spaces" do
    word = "hello world"
    expect{anagrams(word)}.to raise_error
  end

  it "should return an array" do
    expect(anagrams("hello").class).to be(Array)
  end

  it "should look for anagrams" do
    expect(anagrams("looter")).to eq(["RETOOL", "TOOLER"])
  end

end