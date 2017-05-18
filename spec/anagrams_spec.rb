require 'anagrams'
describe 'anagrams' do
  it 'returns array of anagrams that can be made from the specified string and are included in the word list' do
    expect(anagrams("looter", %w(spooky retool rootle tooler toddler))).to eq(["retool", "rootle", "tooler"])
    expect("looter").to be_a(String)
  end
  it 'returns an empty array if not anagrams on the word list can be made' do
    expect(anagrams("zygote", %w(spooky retool rootle tooler toddler))).to eq([])
  end

end
