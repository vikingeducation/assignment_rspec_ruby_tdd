require 'anagram.rb'

describe 'anagram.rb' do

  let(:warning){ 'Wrong input, input should be a word' }

  it 'raise error if first parameter not a string' do
    expect{anagram 1543}.to raise_error(warning)
  end
  it 'raise no error if second parameter not given' do
    expect{anagram 'hello', 'hello'}.to_not raise_error(ArgumentError)
  end
  it 'return warning when no parameter given' do
    expect{anagram}.to raise_error(warning)
  end
  it 'return warning when first parameter has more than one word' do
    expect(anagram "hello world").to eq(warning)
  end
  it 'return nil for all combinations not found in dictionary' do
    expect(anagram "zygote", %w(spooky retool rootle tooler toddler)).to be_empty
  end
  it 'return combinations found in dictionary' do
    expect(anagram "looter", %w(spooky retool rootle tooler toddler)).to eq(["RETOOL", "ROOTLE", "TOOLER"])
  end
  # mock up the dictionary test
  it 'does not need a dictionary input' do
    allow(File).to receive(:readlines).and_return(%w(spooky retool rootle tooler toddler))
    expect(anagram "looter").to eq(["RETOOL", "ROOTLE", "TOOLER"])
  end

end
