require_relative '../lib/anagrams.rb'

describe '#anagrams' do

  it 'should raise an error if argument not given' do
    expect{anagrams}.to raise_error(ArgumentError)
  end

  it 'should return an empty array if only one letter given' do
    expect(anagrams('a')).to eq([])
  end

  it 'should return anagrams when they exist' do
    expect(anagrams('looter')).to eq(["RETOOL", "ROOTLE", "TOOLER"])
  end

  it 'should return an empty array if no anagrams exist'

end