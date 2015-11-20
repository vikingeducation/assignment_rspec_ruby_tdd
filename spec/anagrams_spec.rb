require_relative '../lib/anagrams.rb'

# before do
# end

describe '#anagrams' do

  it 'should raise an error if argument not given' do
    allow(File).to receive(:readlines)
    expect{anagrams}.to raise_error(ArgumentError)
  end

  it 'should return an empty array if only one letter given' do
    allow(File).to receive(:readlines).and_return(['a'])
    expect(anagrams('a')).to eq([])
  end

  it 'should return anagrams when they exist' do
    allow(File).to receive(:readlines).and_return(["retool", "rootle", "tooler"])
    expect(anagrams('looter')).to eq(["RETOOL", "ROOTLE", "TOOLER"])
  end

  it 'should return an empty array if no anagrams exist' do
    allow(File).to receive(:readlines).and_return(["zygote"])
    expect(anagrams('zygote')).to eq([])
  end

end