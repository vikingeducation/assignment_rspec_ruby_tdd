require 'anagrams'

describe 'anagrams' do
  let(:looter){  %w(spooky retool rootle tooler toddler) }

  it 'raises an error if no arguments provided' do
    expect{ anagrams }.to raise_error(ArgumentError)
  end
  it 'raises an error if incorrect arguments provided' do
    expect{ anagrams(1, 'hello')}.to raise_error(ArgumentError)
    expect{ anagrams('hello')}.to raise_error(ArgumentError)
  end
  it 'returns an empty array if no anagrams can be made' do
    expect(anagrams('hello', looter)).to eq([])
  end
  it 'returns array of anagrams in uppercase' do
    expect(anagrams('looter', looter)).to eq(%w(RETOOL ROOTLE TOOLER))
  end
end
