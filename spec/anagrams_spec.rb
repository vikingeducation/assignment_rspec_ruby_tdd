require 'anagrams'

describe '#anagrams' do
  let(:dictionary_double) { ['retool', 'rootle', 'tooler', 'war', 'cheese'] }

  it 'should raise an error if input is not a String' do
    expect{anagrams(123)}.to raise_error("input is not a string")
  end

  it 'should raise an error if input contains more than one word' do
    expect{anagrams('a test')}.to raise_error("input must be one word")
  end

  it 'loads a dictionary file' do
    expect(IO).to receive(:read).with('dictionary.txt').and_return(dictionary_double)

    anagrams('dustin')
  end

  it 'returns anagrams of input in an array' do
    allow(IO).to receive(:read).with('dictionary.txt').and_return(dictionary_double)
    expect(anagrams('looter')).to match_array( ['retool', 'rootle', 'tooler'] )
  end

  it 'returns an empty array if there are no anagrams in dictionary.txt' do
    allow(IO).to receive(:read).with('dictionary.txt').and_return(dictionary_double)
    expect(anagrams('zygote')).to match_array( [] )
  end

end