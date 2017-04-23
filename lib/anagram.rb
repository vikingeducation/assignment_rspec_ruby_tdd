def anagram(string, dictionary)
  raise ArgumentError unless string.is_a?(String)
  raise ArgumentError unless dictionary.is_a?(Array)

  sorted_letters = string.chars.sort
  anagrams = []

  dictionary.each do |word|
    anagrams << word.upcase if word.chars.sort == sorted_letters
  end

  anagrams

end