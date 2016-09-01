require_relative '../lib/anagram.rb'

describe '#anagram' do
  it 'returns a blank array if no anagrams are found' do
    expect(anagrams("xylophone")).to eq([])
  end

  it 'returns anagrams if any are found' do
    expect(anagrams('looter')).to eq(['retool','tooler'])
  end

  it 'returns anagrams if any are found' do
    expect(anagrams('apple')).to eq(['appel','pepla'])
  end
end