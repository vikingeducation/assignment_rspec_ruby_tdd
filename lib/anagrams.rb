def anagrams(word, dictionary)
  raise 'nope' unless word.is_a?(String)
  raise 'nope' if word.include?(' ')
  raise 'nope' unless dictionary.is_a?(Array)

  anagram_arr = []
  dictionary.each do |entry|
    if entry.chars.sort == word.chars.sort
      anagram_arr << entry.upcase
    end
  end
  anagram_arr
end