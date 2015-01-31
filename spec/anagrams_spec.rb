require 'anagrams.rb'

describe '#anagrams' do
  it 'accepts strings' do
    expect do
    anagrams("hello")
    end.not_to raise_error
  end
  it 'returns an error if it receives the wrong argument type' do
    expect do
      anagrams(123)
    end.to raise_error
  end
end