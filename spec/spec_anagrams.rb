require 'anagrams_tdd'

describe '#anagrams' do
  let (:dict_file){double(:readlines => ["bat", "tab", "food"])}
  let (:dict_file_no_ana){double(:readlines => ["bat", "food"])}

  it 'returns nil if no anagrams in dict_file' do 
    expect(anagrams("bat", dict_file_no_ana)).to equal(nil)
  end

  it 'returns an array' do
    expect(anagrams("bat", dict_file)).not_to equal("bat")
  end

  it 'returns anagrams of a given string' do
    expect(anagrams("bat", dict_file)).to eq(["tab"])
  end

end