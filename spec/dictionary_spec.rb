require 'dictionary'
describe 'dictionary' do
  it 'returns array of anagrams that can be made from the specified string and are included in the dictionary' do
    allow(File).to receive(:readlines).and_return(%w(spooky retool rootle tooler toddler))
    expect(anas("looter")).to eq(["retool", "rootle", "tooler"])
  end
  it 'returns an empty array if not anagrams on the word list can be made' do
    allow(File).to receive(:readlines).and_return(%w(spooky retool rootle tooler toddler))
    expect(anas("zygote")).to eq([])
  end

end
