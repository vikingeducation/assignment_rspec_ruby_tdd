DICTIONARY = File.open('enable.txt').read

def anagrams(word)
  raise ArgumentError unless word.is_a?(String)
  ana_candidates = []
  DICTIONARY.each_line do |candidate|
    if (candidate.length - 1) == word.length
      ana_candidates << candidate.gsub("\n",'')
    end
  end
  anagrams = []
  ana_candidates.each do |candidate|
    if candidate.chars.sort == word.chars.sort
      anagrams << candidate
    end
  end
  anagrams.each do |matches|
    if matches == word
      anagrams.delete(matches)
    end
  end
  anagrams
end