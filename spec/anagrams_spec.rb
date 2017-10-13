require 'anagrams'

describe 'anagrams' do 

  it 'takes two arguments' do 
    expect{anagrams('a')}.to raise_error(ArgumentError)
  end

  specify 'that the first agument is a string' do 
    expect{anagrams(1, 2)}.to raise_error(RuntimeError)
  end

  specify 'that the first argument is one-word' do 
    expect{anagrams('hello world', [])}.to raise_error(RuntimeError)
  end

  specify 'that the second argument is an Array' do 
    expect{anagrams('hello', 2)}.to raise_error(RuntimeError)
  end

  it "does not raise and error if the two arguments are a String and 
    an Array, respectively" do 
    expect{anagrams('hello', %w(hello world))}.not_to raise_error
  end

  it 'returns an Array of words from dictionary that are anagrams of the 
    string passed in' do 
    expect(anagrams("looter", %w(spooky retool rootle tooler toddler))).to eql(["RETOOL", "ROOTLE", "TOOLER"])
  end
end