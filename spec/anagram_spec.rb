RSpec.describe '#anagrams' do
  context 'when there are matches' do
    it 'returns matches in upcase' do
      dictionary = %w(spooky retool rootle tooler toddler)
      word = "looter"

      expect(anagrams(word, dictionary)).to eq(["RETOOL", "ROOTLE", "TOOLER"])
    end
  end

  context 'when there are no matches' do
    it 'returns an empty array' do
      dictionary = %w(spooky retool rootle tooler toddler)
      word = "zygote"

      expect(anagrams(word, dictionary)).to be_a Array
      expect(anagrams(word, dictionary)).to be_empty
    end
  end
end

RSpec.describe '#anagrams_from_file' do
  context 'file exists' do
    it 'reads the file of the given path' do
      path = './file.txt'
      dictionary = %W(spooky\n retool\n rootle\n tooler\n toddler\n)
      word = "looter"

      allow(File).to receive(:exist?).with(path).and_return(true)
      expect(File).to receive(:readlines).with(path).and_return(dictionary)
      anagrams_from_file(word, path)
    end

    it 'returns matches in upcase' do
      path = './file.txt'
      dictionary = %W(spooky\n retool\n rootle\n tooler\n toddler\n)
      word = "looter"

      allow(File).to receive(:exist?).with(path).and_return(true)

      expect(File).to receive(:readlines).with(path).and_return(dictionary)
      expect(anagrams_from_file(word, path)).to eq(["RETOOL", "ROOTLE", "TOOLER"])
    end
  end

  context 'file does not exists' do
    it 'returns an empty array' do
      path = './file.txt'
      dictionary = %W(spooky\n retool\n rootle\n tooler\n toddler\n)
      word = "looter"

      allow(File).to receive(:exist?).and_return(false)
      allow(File).to receive(:readlines).and_return(dictionary)

      expect(anagrams_from_file(word, path)).to be_empty
      expect(anagrams_from_file(word, path)).to be_a Array
    end
  end
end
