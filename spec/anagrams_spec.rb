# rspec/anagrams_spec.rb
require 'anagrams'

describe 'anagrams' do

  it 'raises an error if the wrong number of arguments are supplied' do
     expect{anagrams("hello", ["yes", "no"], 2)}.to raise_error(ArgumentError)
  end

  
  it 'returns an array' do 
      expect(anagrams("word",["test"])).is_a?(Array)
  end

  it 'returns an empty array if no anagrams are found' do
    empty_arr = []
    expect(anagrams("zygote", %w(spooky retool rootle tooler toddler))).to match_array(empty_arr)
  end

   it 'returns an array of anagrams in uppercase if found in the dictionary' do
    expect(anagrams("looter", %w(spooky retool rootle tooler toddler))).to eq(["RETOOL", "ROOTLE", "TOOLER"])
  end
end