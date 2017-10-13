require 'anagrams'

describe 'anagrams' do 

  it 'takes two arguments' do 
    expect{anagrams('a')}.to raise_error(ArgumentError)
  end
end